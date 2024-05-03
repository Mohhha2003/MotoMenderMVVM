import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product_request_model.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.storeRepo) : super(StoreInitial());

  final StoreRepo storeRepo;

  Future<void> fetchProducts() async {
    final response = await storeRepo.getAllProducts();
    response.fold(
      (errorMessage) => emit(StoreFailed(errorMessage)),
      (products) => emit(StoreSuccess(products)),
    );
  }
}
