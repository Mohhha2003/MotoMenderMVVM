import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/repos/favorites_repo.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());

  final FavoritesRepo favoritesRepo;

  List<String> productsIds = [];
  List<Product> favorites = [];
  bool isFav = false;

  Future<void> getAllFavorites() async {
    final response = await favoritesRepo.getAllFavorites();
    response.fold((errorMessage) => emit(FavoritesError(message: errorMessage)),
        (products) {
      favorites.addAll(products.products ?? []);
      if (favorites.isEmpty) {
        emit(FavoritesEmpty());
      } else {
        emit(FavoritesPopulated());
      }
    });
  }

  Future<void> addToFavorites({required String productId}) async {
    final response = await favoritesRepo.addToFavorites(productId: productId);
    response.fold((errorMessage) => emit(FavoritesError(message: errorMessage)),
        (product) {
      productsIds.add(product.productId!);
      favorites.add(product);
      emit(FavoriteAdded());
    });
  }

  Future<void> deleteFavorite({required String productId}) async {
    final respone = await favoritesRepo.deleteFavorite(productId: productId);
    respone.fold((errorMessage) => emit(FavoritesError(message: errorMessage)),
        (success) {
      int index = favorites.indexWhere((product) => product.id == productId);
      favorites.removeAt(index);
      productsIds.removeAt(index);
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

  bool isProcutFavorite({required String productId}) {
    for (var id in productsIds) {
      if (id == productId) {
        return true;
      }
    }
    return false;
  }
}
