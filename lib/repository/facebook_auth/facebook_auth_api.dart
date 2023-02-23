// Package imports:
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// Project imports:
import '../../model/user_model.dart';
import 'facebook_auth_repository.dart';

class FacebookAuthApi extends FacebookAuthRepository {
  @override
  Future<UserModel?> signInWithFacebook() async {
    UserModel? userModel;

    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success) {
        throw 'Sign in Failed';
      }
      final Map<String, dynamic> userData =
          await FacebookAuth.instance.getUserData();
      Map<String, dynamic> data = {
        'name': userData['name'],
        'email': userData['email'],
        'image': userData['picture']['data']['url'],
      };
      userModel = UserModel.fromJson(data);
    } catch (e) {
      rethrow;
    }

    return userModel;
  }

  @override
  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
  }
}
