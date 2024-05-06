import 'package:dio/dio.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';

import 'api_interceptors.dart';
import 'endpoints.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 50);
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final respone =
          await dio.delete(path, data: data, queryParameters: queryParameters);
      return respone.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final respone =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return respone.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final respone =
          await dio.patch(path, data: data, queryParameters: queryParameters);
      return respone.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final respone =
          await dio.post(path, data: data, queryParameters: queryParameters);
      return respone.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response =
          await dio.put(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
