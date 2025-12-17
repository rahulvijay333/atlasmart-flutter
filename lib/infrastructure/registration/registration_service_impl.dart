import 'package:atlasmart/domain/registration/model/customer_register_model.dart';
import 'package:atlasmart/domain/registration/registration_service.dart';
import 'package:dio/dio.dart';

import '../../domain/core/network/dio_error_handle.dart';

class RegistrationServiceImpl implements RegistrationService {
  final Dio dio;

  RegistrationServiceImpl({required this.dio});

  @override
  Future<(bool, CustomerRegisterModel)> customerRegistration(
    CustomerRegisterModel customer,
  ) async {
    try {
      final res = await dio.post(
        "/api/auth/register",
        data: {
          "email": customer.email,
          "password": customer.password,
          "name": customer.fullName,
        },
      );
      if (res.statusCode == 201) {
        return (true, customer);
      } else {
        return (false, customer);
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> customerOtpVerify(CustomerRegisterModel customer) async {
    try {
      final res = await dio.post(
        "/api/auth/verify-otp",
        data: {"email": customer.email, "otp": customer.otp},
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
