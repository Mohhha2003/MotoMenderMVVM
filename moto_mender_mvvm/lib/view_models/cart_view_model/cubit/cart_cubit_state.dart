part of 'cart_cubit_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}

final class ProdAdded extends CartCubitState {}

final class ProductRemoved extends CartCubitState {}
final class ProductQuantityChanged extends CartCubitState {}

final class CartEmpty extends CartCubitState {}
final class ValidPromoCode extends CartCubitState {}




