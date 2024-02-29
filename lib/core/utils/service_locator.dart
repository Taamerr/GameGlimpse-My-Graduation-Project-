import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import 'api_services.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';

abstract class ServiceLocator {
  static final getIt = GetIt.instance;
  static void setup() {
    getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
    getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
    getIt.registerSingleton<HomeRepoImpl>(
        HomeRepoImpl(apiService: getIt.get<ApiService>()));
  }
}
