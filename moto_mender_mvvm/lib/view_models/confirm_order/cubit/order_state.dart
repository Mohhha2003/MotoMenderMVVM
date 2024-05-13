part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class ConfirmOrderInitial extends OrderState {}

final class OrderPlaced extends OrderState {}

final class ConfirmOrderFailed extends OrderState {
  final String message;

  ConfirmOrderFailed({required this.message});
}

final class ConfirmOrderLoading extends OrderState {}

final class UserOrdersSuccess extends OrderState {
  final OrderRequest orderRequest;

  UserOrdersSuccess({required this.orderRequest});
}

final class PromoCodeValid extends OrderState {}
