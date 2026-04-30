import 'package:atlasmart/domain/admin/profile/model/admin_profile.dart';

abstract class AdminProfileService {
  Future<AdminUserModel> getProfileDetails();

  Future<AdminUserModel> editProfile(AdminUserModel profile);
}
