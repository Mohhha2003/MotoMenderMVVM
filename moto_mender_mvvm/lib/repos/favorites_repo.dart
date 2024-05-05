import 'package:dartz/dartz.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';
import 'package:moto_mender_mvvm/models/product_request_model/data.dart';

class FavoritesRepo {
  final ApiConsumer api;

  FavoritesRepo({required this.api});

  Future<Either<String, Data>> getAllFavorites() async {
    try {
      final response = await api.get(EndPoint.getAllFavorties,
          data: {ApiKey.userId: CacheHelper.currentUser.id});
      return Right(Data.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> addToFavorites(
      {required String productId}) async {
    try {
      final response = await api.post(EndPoint.addFavorite, data: {
        ApiKey.userId: CacheHelper.currentUser.id,
        ApiKey.productId: productId
      });
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteFavorite(
      {required String productId}) async {
    try {
      final response = await api.delete(EndPoint.deleteFavorite, data: {
        ApiKey.userId: CacheHelper.currentUser.id,
        ApiKey.productId: productId
      });
      print(response);

      return Right('Success');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
