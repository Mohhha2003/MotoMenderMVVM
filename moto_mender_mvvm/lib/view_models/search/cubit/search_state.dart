import 'package:moto_mender_mvvm/models/product.dart';

enum SearchStatus { inital, success, failed, updated }

class SearchState {
  final List<Product> products;
  final SearchStatus status;
  final String queryParameters;
  final String? errorMessage;
  final bool isLoading;

  SearchState(
      {required this.products,
      required this.isLoading,
      this.errorMessage,
      required this.status,
      required this.queryParameters});

  factory SearchState.initial() => SearchState(
      status: SearchStatus.inital,
      products: [],
      queryParameters: '',
      isLoading: false);

  SearchState copyWith(
      {List<Product>? products,
      bool? isLoading,
      String? errorMessage,
      SearchStatus? status,
      String? queryParameters}) {
    return SearchState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        products: products ?? this.products,
        queryParameters: queryParameters ?? this.queryParameters);
  }
}
