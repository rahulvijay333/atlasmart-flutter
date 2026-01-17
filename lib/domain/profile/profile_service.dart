import 'model/profile_model.dart';

abstract class ProfileService {
  Future<ProfileModel> getProfileDetails();

  Future<ProfileModel> editProfile(ProfileModel profile);
}
