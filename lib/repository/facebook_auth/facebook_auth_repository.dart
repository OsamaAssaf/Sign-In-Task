// Project imports:
import '../../model/user_model.dart';

abstract class FacebookAuthRepository{
  Future<UserModel?> signInWithFacebook();
  Future<void> logout();
}
