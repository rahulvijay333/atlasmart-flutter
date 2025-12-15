import 'package:atlasmart/domain/registration/model/customer_register_model.dart';

abstract class RegistrationService {
  Future<void> customerRegistration(CustomerRegisterModel customer);
}
