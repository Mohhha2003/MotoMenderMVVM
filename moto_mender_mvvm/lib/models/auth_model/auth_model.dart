import 'user..dart';

class AuthModel {
  String? message;
  User? user;
  String? token;

  AuthModel({this.message, this.user, this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };
}
