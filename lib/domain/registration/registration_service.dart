import 'package:atlasmart/domain/registration/model/customer_register_model.dart';

abstract class RegistrationService {
  Future<bool> customerRegistration(CustomerRegisterModel customer);
}
