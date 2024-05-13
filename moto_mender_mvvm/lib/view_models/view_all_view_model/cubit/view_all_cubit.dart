import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';
import 'package:moto_mender_mvvm/view_models/view_all_view_model/cubit/view_all_state.dart';

class ViewAllCubit extends Cubit<ViewAllState> {
  ViewAllCubit(this.repo) : super(ViewAllState.initial()) {
    fetchProducts();
  }

  final StoreRepo repo;

  void fetchProducts() async {
    if (!state.isLoading && !state.hasReachedMax) {
      emit(state.copyWith(isLoading: true));
      final response = await repo.fetchProducts(queryParameters: {"limit": 10});
      response.fold(
          (errorMessage) => emit(state.copyWith(
              errorMessage: errorMessage,
              status: ViewAllStatus.fetchProductsFailed)),
          (newProducts) => emit(state.copyWith(
              status: ViewAllStatus.fetchProductsSuccess,
              isLoading: false,
              products: newProducts.data!.products!)));
    }
  }

  Future<void> onEndReached() async {
    
        emit(state.copyWith(page: state.page));
        await fetchMoreProducts();
      
  }

  Future<void> fetchMoreProducts() async {
    if (!state.isLoading && !state.hasReachedMax) {
      final response = await repo.fetchProducts(
          queryParameters: {"limit": state.limit, "page": state.page});
      response.fold(
        (errorMessage) => emit(state.copyWith(
              isLoading: false,
              errorMessage: errorMessage,
              status: ViewAllStatus.fetchProductsFailed)), (newProducts) {
        List<Product> products = state.products;
        products.addAll(newProducts.data!.products!);
        emit(state.copyWith(
            status: ViewAllStatus.fetchProductsSuccess,
            isLoading: false,
            hasReachedMax: state.products.length < products.length,
            products: products));
      });
    }
  }
}
