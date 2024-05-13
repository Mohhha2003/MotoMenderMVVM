import 'package:moto_mender_mvvm/models/product.dart';

enum SearchStatus { inital, success, failed, updated }

class SearchState {
  final List<Product> products;
  final SearchStatus status;
  final String? sort;
  final String? sortOrder;
  final String? errorMessage;
  final bool isLoading;

  SearchState(
      {required this.products,
      required this.isLoading,
      this.sortOrder,
      this.errorMessage,
      required this.status,
      this.sort});

  factory SearchState.initial() => SearchState(
      status: SearchStatus.inital,
      products: [],
      isLoading: false,
      sort: 'ratingAverage',
      sortOrder: 'desc');

  SearchState copyWith(
      {List<Product>? products,
      String? sortOrder,
      bool? isLoading,
      String? errorMessage,
      SearchStatus? status,
      String? sort}) {
    return SearchState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        products: products ?? this.products,
        sortOrder: sortOrder ?? this.sortOrder,
        sort: sort ?? this.sort);
  }
}
