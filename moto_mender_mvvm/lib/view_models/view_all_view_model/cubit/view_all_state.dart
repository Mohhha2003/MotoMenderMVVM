import 'package:moto_mender_mvvm/models/product.dart';

enum ViewAllStatus {
  inital,
  fetchProductsSuccess,
  fetchMoreProducts,
  fetchProductsFailed
}

class ViewAllState {
  final ViewAllStatus status;
  final int page;
  final int limit;
  final String errorMessage;
  final List<Product> products;
  final bool isLoading;
  final bool hasReachedMax;

  const ViewAllState({
    required this.limit,
    required this.page,
    required this.errorMessage,
    required this.status,
    required this.products,
    required this.isLoading,
    required this.hasReachedMax,
  });

  factory ViewAllState.initial() {
    return const ViewAllState(
      limit: 10,
      page: 1,
      errorMessage: 'Error',
      status: ViewAllStatus.inital,
      products: [],
      isLoading: false,
      hasReachedMax: false,
    );
  }

  ViewAllState copyWith(
      {List<Product>? products,
      bool? isLoading,
      bool? hasReachedMax,
      String? errorMessage,
      int? limit,
      int? page,
      ViewAllStatus? status}) {
    return ViewAllState(
        limit: limit ?? this.limit,
        page: page ?? this.page,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
