import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.storeRepo) : super(StoreInitial()) {
    fetchProducts();
  }

  final StoreRepo storeRepo;
  List<Product> products = [];
  int page = 1;

  Future<void> fetchProducts({int? page, int? limit}) async {
    final response = await storeRepo
        .fetchProducts(queryParameters: {"page": page, "limit": limit});
    response.fold(
      (errorMessage) => emit(StoreFailed(errorMessage)),
      (success) {
         products = success.data!.products!;
        emit(StoreSuccess(products));
      },
    );
  }

  
}
