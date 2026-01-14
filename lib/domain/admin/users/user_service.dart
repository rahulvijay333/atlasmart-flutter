import 'model/user_model.dart';

abstract class UserService {
  Future<List<UserModel>> getAllUsers();
}
