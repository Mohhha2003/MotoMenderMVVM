import 'package:dartz/dartz.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_product_list_model.dart';
import 'package:moto_mender_mvvm/models/order_request/order_request.dart';

class OrdersRepo {
  final ApiConsumer api;

  OrdersRepo({required this.api});

  Future<Either<String, String>> placeNewOrder(
      {required List<CartProductsListModel> products}) async {
    try {
      final response = await api.post(EndPoint.placeNewOrder, data: {
        ApiKey.orderProducts:
            products.map((product) => product.toJson()).toList(),
        ApiKey.userId: CacheHelper.currentUser.id,
      });
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, OrderRequest>> getUserOrders(
      {required String userId}) async {
    try {
      final resposne =
          await api.get(EndPoint.getUserOrders, data: {ApiKey.userId: userId});
      return Right(OrderRequest.fromJson(resposne));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
