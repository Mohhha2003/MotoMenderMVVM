import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moto_mender_mvvm/core/api/dio_consumer.dart';
import 'package:moto_mender_mvvm/repos/store_repo.dart';

GetIt getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<StoreRepo>(StoreRepo(api: getIt<DioConsumer>()));
}
