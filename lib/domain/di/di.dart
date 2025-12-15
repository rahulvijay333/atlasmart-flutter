import 'package:atlasmart/application/login/login_bloc.dart';
import 'package:atlasmart/domain/login/login_service.dart';
import 'package:atlasmart/domain/token/token_service.dart';
import 'package:atlasmart/infrastructure/login/login_service_impl.dart';
import 'package:atlasmart/infrastructure/token/token_service_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../application/auth/auth_bloc.dart';

import '../../infrastructure/interceptor/interceptor.dart';

import '../token/token_storage.dart';

final sl = GetIt.instance;

void setupDI() {
  // -------------------------
  // 1. TokenStorage
  // -------------------------
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());
  sl.registerLazySingleton<TokenService>(
    () => TokenServiceImpl(storage: sl<TokenStorage>()),
  );

  // -------------------------
  // 2. Dio
  // -------------------------
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:3000'));

    dio.interceptors.add(
      DioInterceptor(sl<TokenStorage>(), sl<TokenService>()),
    );

    return dio;
  });

  // -------------------------
  // 3. LoginRepository
  // -------------------------
  sl.registerLazySingleton<LoginService>(
    () => LoginServiceImpl(dio: sl<Dio>(), storage: sl<TokenStorage>()),
  );

  // -------------------------
  // 4. Blocs
  // -------------------------
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl<TokenStorage>()));

  sl.registerFactory<LoginBloc>(
    () => LoginBloc(loginService: sl<LoginService>()),
  );
}

// Future<void> setupDI()async {
//   // 1. TokenStorage
//   sl.registerLazySingleton(() => TokenStorage());

//   // 2. AuthRepository
//   sl.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(sl<Dio>(), sl<TokenStorage>()),
//   );

//   // 3. Dio + AuthInterceptor
//   sl.registerLazySingleton(() {
//     final dio = Dio(BaseOptions(baseUrl: "https://api.com"));
//     dio.interceptors.add(
//       AuthInterceptor(
//         sl<TokenStorage>(),
//         sl<AuthRepository>()
//             as AuthRepositoryImpl, // or better, make interceptor use abstract
//       ),
//     );
//     return dio;
//   });

//   // 4. AuthBloc
//   sl.registerFactory(() => AuthBloc(sl<AuthRepository>(), sl<TokenStorage>()));
//   sl.registerFactory(() => LoginBloc(authRepository: sl<AuthRepository>()));
// }
