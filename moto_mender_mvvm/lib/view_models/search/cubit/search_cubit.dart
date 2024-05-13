import 'package:bloc/bloc.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repo) : super(SearchState.initial()) {
    getSearchProducts();
  }
  final StoreRepo repo;

  void setQueryParameter({String? sort, String? sortOrder}) {
    emit(state.copyWith(
        sort: sort, sortOrder: sortOrder, status: SearchStatus.updated));
    fetchProductsWithParams();
  }

  void getSearchProducts() async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true));
      final response = await repo.fetchProducts();

      response.fold(
          (errorMessage) => emit(state.copyWith(
              status: SearchStatus.failed, errorMessage: errorMessage)),
          (produts) => emit(state.copyWith(
              status: SearchStatus.success,
              products: produts.data!.products!,
              isLoading: false)));
    }
  }

  Future<void> fetchProductsWithParams() async {
    if (!state.isLoading) {
      final response = await repo.fetchProducts(queryParameters: {
        "sort": state.sort ?? 'ratingAverage',
      });
      response.fold(
          (errorMessage) => emit(state.copyWith(
              isLoading: false,
              errorMessage: errorMessage,
              status: SearchStatus.failed)), (newProducts) {
        emit(state.copyWith(
            status: SearchStatus.success,
            isLoading: false,
            products: newProducts.data?.products ?? []));
      });
    }
  }

  Future<void> fetchMoreProducts() async {
    if (!state.isLoading) {
      final response =
          await repo.fetchProducts(queryParameters: {"limit": 4, "page": 2});
      response.fold(
          (errorMessage) => emit(state.copyWith(
              isLoading: false,
              errorMessage: errorMessage,
              status: SearchStatus.failed)), (newProducts) {
        List<Product> products = state.products;
        products.addAll(newProducts.data!.products!);
        emit(state.copyWith(
            status: SearchStatus.success,
            isLoading: false,
            products: products));
      });
    }
  }

  Future<void> onEndReached() async {
    emit(state.copyWith());
    await fetchMoreProducts();
  }
}
