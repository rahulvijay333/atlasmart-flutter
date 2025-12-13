import 'package:atlasmart/infrastructure/auth/auth_service_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../application/auth/auth_bloc.dart';
import '../../infrastructure/auth/auth_interceptor_impl.dart';
import '../auth/auth_service.dart';
import '../token/token_storage.dart';

final sl = GetIt.instance;

void setupDI() {
  // 1. TokenStorage
  sl.registerLazySingleton(() => TokenStorage());

  // 2. AuthRepository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<Dio>(), sl<TokenStorage>()),
  );

  // 3. Dio + AuthInterceptor
  sl.registerLazySingleton(() {
    final dio = Dio(BaseOptions(baseUrl: "https://api.com"));
    dio.interceptors.add(
      AuthInterceptor(
        sl<TokenStorage>(),
        sl<AuthRepository>()
            as AuthRepositoryImpl, // or better, make interceptor use abstract
      ),
    );
    return dio;
  });

  // 4. AuthBloc
  sl.registerFactory(() => AuthBloc(sl<AuthRepository>(), sl<TokenStorage>()));
}
