part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class StoreLoading extends StoreState {}

final class StoreSuccess extends StoreState {
  final List<Product> products;

  StoreSuccess(this.products);
}

final class StoreFailed extends StoreState {
  final String message;

  StoreFailed(this.message);
}

//   VEIW ALL STATES
final class EndReached extends StoreState {}

final class PagenationSuccesss extends StoreState {}

final class PagenationFailed extends StoreState {
  final String message;

  PagenationFailed({required this.message});
}
