import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/repos/favorites_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());

  final FavoritesRepo favoritesRepo;

  List<Product> favorites = [];

  Future<void> getAllFavorites() async {
    final response = await favoritesRepo.getAllFavorites();
    response.fold((errorMessage) => emit(FavoritesError(message: errorMessage)),
        (products) {
      favorites.addAll(products.products ?? []);
      if (favorites.isEmpty) {
        print('Cart is Empty ......');
        emit(FavoritesEmpty());
      } else {
        emit(FavoriteAdded());
      }
    });
  }

  Future<void> addToFavorites({required String productId}) async {
    final response = await favoritesRepo.addToFavorites(productId: productId);
    response.fold((errorMessage) => emit(FavoritesError(message: errorMessage)),
        (success) {
          
      emit(FavoriteAdded());
    });
  }

  Future<void> deleteFavorite({required String productId}) async {
    final respone = await favoritesRepo.deleteFavorite(productId: productId);
    respone.fold((errorMessage) => emit(FavoritesError(message: errorMessage)),
        (success) {
      int index = favorites.indexWhere((product) => product.id == productId);
      favorites.removeAt(index);
      if (isFavortiesEmpty()) {
        emit(FavoritesEmpty());
      } else {
        emit(FavoriteDeleted(message: success));
      }
    });
  }

  bool isFavortiesEmpty() {
    if (favorites.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
