import '../profile/model/admin_profile.dart';

abstract class ManageAdminService {
  Future<List<AdminUserModel>> getAllAdmins();

  Future<bool> addNewAdmin(AdminUserModel admin);

  Future<AdminUserModel> editAdmin(AdminUserModel admin);

  Future<bool> deleteAdmin(AdminUserModel admin);
}
