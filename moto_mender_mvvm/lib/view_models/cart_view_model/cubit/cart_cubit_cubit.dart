import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/models/product.dart';
part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit() : super(CartCubitInitial());

  TextEditingController promoCode = TextEditingController();

  List<Product> cartProducts = [];
  double subtotal = 0;
  double discount = 0;
  double deleviryFee = 0;

  bool isCartEmpty() {
    if (cartProducts.isEmpty) {
      return true;
    }
    return false;
  }

  void addToCart({required Product prodcut}) {
    if (cartProducts.contains(prodcut)) {
      int index = cartProducts.indexOf(prodcut);
      cartProducts[index].orderQuantity =
          cartProducts[index].orderQuantity! + 1;
    } else {
      prodcut.orderQuantity = 1;
      cartProducts.add(prodcut);
    }
    calculateOrderDetails();
    emit(ProdAdded());
  }

  void removeFromCart({required Product product}) {
    cartProducts.remove(product);
    calculateOrderDetails();
    emit(ProductRemoved());
    if (cartProducts.isEmpty) {
      emit(CartEmpty());
    }
  }

  void incrementQuantity({required Product product}) {
    int index = cartProducts.indexOf(product);
    cartProducts[index].orderQuantity = cartProducts[index].orderQuantity! + 1;
    calculateOrderDetails();
    emit(ProductQuantityChanged());
  }

  void decrementQuantity({required Product product}) {
    int index = cartProducts.indexOf(product);
    if (cartProducts[index].orderQuantity! == 1) {
      cartProducts.remove(product);

      if (isCartEmpty()) {
        emit(CartEmpty());
      } else {
        calculateOrderDetails();
        emit(ProductQuantityChanged());
      }
    } else {
      cartProducts[index].orderQuantity =
          cartProducts[index].orderQuantity! - 1;
      calculateOrderDetails();

      emit(ProductQuantityChanged());
    }
  }

  void calculateOrderDetails() {
    subtotal = 0;
    discount = 0;
    for (var product in cartProducts) {
      subtotal += product.price! * product.orderQuantity!;
    }
    deleviryFee = 15;
    if (promoCode.text.isNotEmpty) {
      discount = subtotal * .02;
    }
  }

  bool isValidPromoCode() {
    if (promoCode.text.length > 6) {
      emit(ValidPromoCode());
      return true;
    }
    return false;
  }
}
