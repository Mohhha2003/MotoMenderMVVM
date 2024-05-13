import 'package:bloc/bloc.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repo) : super(SearchState.initial());
  final StoreRepo repo;

  void setQueryParameter({required String queryParameter}) {
    emit(state.copyWith(
        queryParameters: queryParameter, status: SearchStatus.updated));
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

  void addSearchFilter({required String queryParameters}) {
    state.copyWith(
        queryParameters: queryParameters, status: SearchStatus.updated);
  }

  Future<void> fetchProductsWithParams() async {
    if (!state.isLoading) {
      final response =
          await repo.fetchProducts(queryParameters: {"limit": 2, "page": 1});
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
    await fetchProductsWithParams();
  }
}
