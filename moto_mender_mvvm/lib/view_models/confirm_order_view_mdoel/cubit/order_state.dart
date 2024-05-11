part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderPlaced extends OrderState {}

final class OrderFailed extends OrderState {
  final String message;

  OrderFailed({required this.message});
}

final class OrderLoading extends OrderState {}

final class UserOrdersSuccess extends OrderState {
  final OrderRequest orderRequest;

  UserOrdersSuccess({required this.orderRequest});
}

final class PromoCodeValid extends OrderState {}
