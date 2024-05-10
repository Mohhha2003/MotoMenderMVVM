import 'package:dio/dio.dart';
import 'package:moto_mender_mvvm/core/api/dio_consumer.dart';
import 'package:moto_mender_mvvm/models/user.dart';
import 'package:moto_mender_mvvm/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static bool rememberMe = false;
  static late User currentUser;

  Future<bool> isUserSaved() async {
    rememberMe = sharedPreferences.containsKey('email');
    if (rememberMe) {
      final respone = await AuthRepo(api: DioConsumer(dio: Dio())).login(
          email: getDataString(key: 'email')!,
          password: getDataString(key: 'password')!);
      respone.fold((error) => currentUser = User(),
          (success) => currentUser = success.user!);
    }
    return rememberMe;
  }

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData() async {
    return sharedPreferences.clear();
  }
}
