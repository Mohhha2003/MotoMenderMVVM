import 'package:dartz/dartz.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product_request_model.dart';

class StoreRepo {
  final ApiConsumer api;

  StoreRepo({required this.api});

  Future<Either<String, ProductRequestModel>> getAllProducts() async {
    try {
      final respone = await api.get(EndPoint.products);
      final products = ProductRequestModel.fromJson(respone);
      return Right(products);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    } 
  }
}
