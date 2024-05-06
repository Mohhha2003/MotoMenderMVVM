import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this.storeRepo) : super(StoreInitial());

  final StoreRepo storeRepo;
  List<Product> products = [];

  Future<void> fetchProducts() async {
    final response = await storeRepo.getAllProducts();
    response.fold(
      (errorMessage) => emit(StoreFailed(errorMessage)),
      (success) {
        products = success.data!.products!;
        emit(StoreSuccess(products));
      },
    );
  }
}
