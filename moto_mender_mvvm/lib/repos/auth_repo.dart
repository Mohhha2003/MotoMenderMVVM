import 'package:dartz/dartz.dart';
import 'package:moto_mender_mvvm/core/api/api_consumer.dart';
import 'package:moto_mender_mvvm/core/api/endpoints.dart';
import 'package:moto_mender_mvvm/core/errors/error_model.dart';
import 'package:moto_mender_mvvm/core/errors/exceptions.dart';
import 'package:moto_mender_mvvm/models/auth_model/auth_model.dart';

class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  Future<Either<String, AuthModel>> login(
      {required String email, required String password}) async {
    try {
      final response = await api.post(EndPoint.signIn,
          data: {ApiKey.email: email, ApiKey.password: password});
      final loginModel = AuthModel.fromJson(response);
      return Right(loginModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, AuthModel>> signUp(
      {required String email,
      required String name,
      required String password,
      required String phone,
      required String address}) async {
    try {
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.password: password,
        ApiKey.phone: phone,
        ApiKey.address: address,
      });
      final loginModel = AuthModel.fromJson(response);
      return Right(loginModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> forgetPassword({required String email}) async {
    try {
      final respone =
          await api.post(EndPoint.forgetPassword, data: {ApiKey.email: email});
      return Right(respone['otp']);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> resetPassword(
      {required String newPassword,
      required String otp,
      required String email}) async {
    try {
      final response = await api.patch(EndPoint.resetPassword, data: {
        ApiKey.email: email,
        ApiKey.otp: otp,
        ApiKey.newPassword: newPassword,
      });
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> verfiyEmail({required String email}) async {
    try {
      final response =
          await api.patch(EndPoint.verfiyEmail, data: {ApiKey.email: email});

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> updateAccount({required String id}) async {
    try {
      final response = await api.put(EndPoint.updateAccount,
          data: {ApiKey.id: id, ApiKey.isVerified: true});
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> googleSignIn() async {
    try {
      final respones = await api.get(EndPoint.googleSignIn);
      print('The data from google signin is ${respones}');
      return Right('Success');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, ErrorModel>> logOut() async {
    try {
      final response = await api.get(EndPoint.logOut);
      return Right(ErrorModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
