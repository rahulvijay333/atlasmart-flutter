import 'package:atlasmart/application/admin/users/all_users_bloc.dart';
import 'package:atlasmart/application/forgot_password/forgot_password_bloc.dart';
import 'package:atlasmart/application/login/login_bloc.dart';
import 'package:atlasmart/application/registration/customer/custom_registr_bloc/customer_register_bloc.dart';
import 'package:atlasmart/domain/admin/users/user_service.dart';
import 'package:atlasmart/domain/endpoints/api_endpoints.dart';
import 'package:atlasmart/domain/login/login_service.dart';
import 'package:atlasmart/domain/profile/profile_service.dart';
import 'package:atlasmart/domain/token/token_service.dart';
import 'package:atlasmart/infrastructure/admin/users/user_service_impl.dart';
import 'package:atlasmart/infrastructure/login/login_service_impl.dart';
import 'package:atlasmart/infrastructure/profile/profile_service_impl.dart';
import 'package:atlasmart/infrastructure/registration/registration_service_impl.dart';
import 'package:atlasmart/infrastructure/token/token_service_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../../application/auth/auth_bloc.dart';

import '../../../application/profile/customer/customer_profile_bloc.dart';
import '../../../infrastructure/interceptor/interceptor.dart';

import '../../registration/registration_service.dart';
import '../../token/token_storage.dart';
import '../config/app_config.dart';

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
    final dio = Dio(BaseOptions(baseUrl: AppConfig.instance.baseUrl));

    dio.interceptors.add(
      DioInterceptor(sl<TokenStorage>(), sl<TokenService>()),
    );

    return dio;
  });

  // -------------------------
  // 3. Services
  // -------------------------
  sl.registerLazySingleton<LoginService>(
    () => LoginServiceImpl(dio: sl<Dio>(), storage: sl<TokenStorage>()),
  );
  sl.registerLazySingleton<RegistrationService>(
    () => RegistrationServiceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<ProfileService>(
    () => ProfileServiceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<UserService>(() => UserServiceImpl(dio: sl<Dio>()));

  // -------------------------
  // 4. Blocs
  // -------------------------
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl<TokenStorage>()));

  sl.registerFactory<LoginBloc>(
    () => LoginBloc(loginService: sl<LoginService>()),
  );
  sl.registerFactory<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(sl<LoginService>()),
  );
  sl.registerFactory<CustomerRegisterBloc>(
    () => CustomerRegisterBloc(sl<RegistrationService>(), sl<LoginService>()),
  );
  sl.registerFactory<CustomerProfileBloc>(
    () => CustomerProfileBloc(sl<ProfileService>()),
  );

  sl.registerFactory<AllUsersBloc>(() => AllUsersBloc(sl<UserService>()));
}
