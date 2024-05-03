import 'package:moto_mender_mvvm/core/api/endpoints.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKey.status],
      errorMessage: json[ApiKey.errorMessage],
    );
  }
}
