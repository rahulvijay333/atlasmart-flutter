import 'package:atlasmart/domain/customer/registration/model/customer_register_model.dart';

abstract class RegistrationService {
  Future<(bool, CustomerRegisterModel)> customerRegistration(
    CustomerRegisterModel customer,
  );
  Future<bool> customerOtpVerify(CustomerRegisterModel customer);
}
