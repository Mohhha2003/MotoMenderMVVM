import 'package:dartz/dartz.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';

class OrdersRepo {
  final ApiConsumer api;

  OrdersRepo({required this.api});

  Future<Either<String, String>> placeNewOrder(
      {required List<Map<String, dynamic>> products}) async {
    try {
      final response = await api.post(EndPoint.placeNewOrder, data: {
        ApiKey.orderProducts: products.toList(),
        ApiKey.userId: CacheHelper.currentUser.id
      });

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
