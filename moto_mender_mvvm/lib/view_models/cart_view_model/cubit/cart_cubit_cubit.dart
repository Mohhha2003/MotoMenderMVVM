import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/models/product.dart';

part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit() : super(CartCubitInitial());

  List<Product> cartProducts = [];

  bool isCartEmpty() {
    if (cartProducts.isEmpty) {
      emit(CartEmpty());
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
    emit(ProdAdded());
  }

  void removeFromCart({required Product product}) {
    cartProducts.remove(product);
    emit(ProductRemoved());
    if (cartProducts.isEmpty) {
      emit(CartEmpty());
    }
  }

  void incrementQuantity({required Product product}) {
    int index = cartProducts.indexOf(product);
    cartProducts[index].orderQuantity = cartProducts[index].orderQuantity! + 1;
    emit(ProdAdded());
  }

  void decrementQuantity({required Product product}) {
    int index = cartProducts.indexOf(product);
    if (cartProducts[index].orderQuantity! == 1) {
      cartProducts.remove(product);
      if (isCartEmpty()) {
      } else {
        emit(ProductRemoved());
      }
    } else {
      cartProducts[index].orderQuantity =
          cartProducts[index].orderQuantity! - 1;
      emit(ProductRemoved());
    }
  }
}
