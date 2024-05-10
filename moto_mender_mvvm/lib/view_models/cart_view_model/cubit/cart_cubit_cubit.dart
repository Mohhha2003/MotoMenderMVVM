import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_model.dart';
import 'package:moto_mender_mvvm/repos/cart_repo.dart';
import 'package:moto_mender_mvvm/repos/orders_repo.dart';
part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit(this.ordersRepo, this.cartRepo) : super(CartCubitInitial()) {
    // getCartProducts();
  }

  final OrdersRepo ordersRepo;
  final CartRepo cartRepo;

  TextEditingController promoCode = TextEditingController();

  CartModel cartProducts = CartModel(products: []);
  double subtotal = 0;
  double discount = 0;
  double deleviryFee = 0;

// HELPER MEHTODS

  void calculateOrderDetails() {
    subtotal = 0;
    discount = 0;
    for (var cartProdut in cartProducts.products!) {
      subtotal += cartProdut.product!.price! * cartProdut.quantity!;
    }
    deleviryFee = 15;
    if (promoCode.text.isNotEmpty) {
      discount = subtotal * .02;
    }
  }

  int findProductIndex({required String productId}) {
    return cartProducts.products!.indexWhere((cart) {
      return cart.product!.productId == productId;
    });
  }

  bool isProductInCart(CartModel newCartProduct, bool isInCart) {
    for (var product in cartProducts.products!) {
      if (product.product!.productId ==
          newCartProduct.products!.first.product!.productId) {
        isInCart = true;
        continue;
      }
    }
    return isInCart;
  }

  bool isCartEmpty() {
    if (cartProducts.products!.isEmpty) {
      return true;
    }
    return false;
  }

  // API METHODS

  Future<void> removeCartProduct({required String productId}) async {
    emit(Loading());
    final response = await cartRepo.removeProductFromCart(productId: productId);
    response.fold((errorMessage) => emit(CartFailed(message: errorMessage)),
        (succes) {
      emit(EndLoading());
      cartProducts.products!
          .removeWhere((product) => product.product!.productId! == productId);
      calculateOrderDetails();
      emit(ProductRemoved());
      if (isCartEmpty()) {
        return emit(CartEmpty());
      }
      emit(CartBaseState());
    });
  }

  Future<void> getCartProducts() async {
    emit(Loading());
    final response = await cartRepo.getUserCartProducts();
    response.fold((errorMessage) => emit(CartFailed(message: errorMessage)),
        (apiCartProducts) {
      emit(EndLoading());
      cartProducts = apiCartProducts;
      if (cartProducts.products!.isEmpty) {
        return emit(CartEmpty());
      }
      emit(CartBaseState());
    });
  }

  Future<void> addToCart({required String productId}) async {
    final response = await cartRepo.addToCart(
        productId: productId, userId: CacheHelper.currentUser.id!);
    response.fold((errorMessage) => emit(CartFailed(message: errorMessage)),
        (newCartProduct) {
      bool isInCart = false;
      isInCart = isProductInCart(newCartProduct, isInCart);
      if (isInCart) {
        cartProducts = CartModel(products: []);
        getCartProducts();
      } else {
        cartProducts.products!.addAll(newCartProduct.products!);
      }
      emit(ProductAdded());
      emit(CartBaseState());
    });
  }

  Future<void> incrementProductQuantity({required String productId}) async {
    final response =
        await cartRepo.incrementProductQuantity(productId: productId);
    response.fold((errorMessage) => emit(CartFailed(message: errorMessage)),
        (success) {
      int index = findProductIndex(productId: productId);
      cartProducts.products![index].quantity =
          cartProducts.products![index].quantity! + 1;
      emit(ProductQuantityChanged());
    });
  }

  Future<void> decrementProductQuantity({required String productId}) async {
    final response =
        await cartRepo.decrementProductQuantity(productId: productId);
    response.fold((errorMessage) => emit(CartFailed(message: errorMessage)),
        (success) {
      int index = findProductIndex(productId: productId);
      cartProducts.products![index].quantity =
          cartProducts.products![index].quantity! - 1;
      if (cartProducts.products![index].quantity == 0) {
        cartProducts.products!.removeAt(index);
        return emit(CartEmpty());
      } else {
        emit(ProductQuantityChanged());
      }
    });
  }
}
