import 'package:dartz/dartz.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_model.dart';
import 'package:moto_mender_mvvm/models/product.dart';

class CartRepo {  
  final ApiConsumer api;

  CartRepo({required this.api});

  Future<Either<String, CartModel>> addToCart(
      {required String productId, required String userId}) async {
    try {
      final response = await api.post(EndPoint.addToCart,
          data: {ApiKey.productId: productId, ApiKey.userId: userId});
      return Right(CartModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, CartModel>> getUserCartProducts() async {
    try {
      final respone = await api.get(EndPoint.getCartProdcuts,
          data: {ApiKey.userId: CacheHelper.currentUser.id});
      return Right(CartModel.fromJson(respone));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> removeProductFromCart(
      {required String productId}) async {
    try {
      final response = await api.delete(EndPoint.removeCartProduct, data: {
        ApiKey.productId: productId,
        ApiKey.userId: CacheHelper.currentUser.id!
      });
      return const Right('Product Deleted');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> incrementProductQuantity(
      {required String productId}) async {
    try {
      final response = await api.post(EndPoint.incrementQuantity, data: {
        ApiKey.userId: CacheHelper.currentUser.id,
        ApiKey.productId: productId
      });
      return Right('Increment');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
  Future<Either<String, String>> decrementProductQuantity(
      {required String productId}) async {
    try {
      final response = await api.post(EndPoint.decrementQuantity, data: {
        ApiKey.userId: CacheHelper.currentUser.id,
        ApiKey.productId: productId
      });
      return Right('Decrement');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
