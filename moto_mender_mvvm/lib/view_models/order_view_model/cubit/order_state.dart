part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrdersLoading extends OrderState {}

final class OrdersSucces extends OrderState {
  final OrderRequest orders;

  OrdersSucces({required this.orders});
}

final class OrdersFailed extends OrderState {
  final String message;
  OrdersFailed({required this.message});
}
