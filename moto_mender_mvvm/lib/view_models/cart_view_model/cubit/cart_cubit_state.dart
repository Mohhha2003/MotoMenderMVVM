part of 'cart_cubit_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}
final class CartCubitStartup extends CartCubitState {}


//     CART BASE STATE
final class CartBaseState extends CartCubitState {}

final class CartEmpty extends CartCubitState {}

final class Loading extends CartCubitState {}
final class EndLoading extends CartCubitState {}


final class CartFailed extends CartCubitState {
  final String message;

  CartFailed({required this.message});
}

//    ADDITION AND REMOVAL OF PRODUCTS

final class ProductAdded extends CartCubitState {}

final class ProductRemoved extends CartCubitState {}

//  QUANTITY STATE

final class ProductQuantityChanged extends CartCubitState {}
