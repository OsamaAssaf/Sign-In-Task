// Project imports:
import '../../model/user_model.dart';

abstract class GoogleAuthRepository{

  Future<UserModel?> signInWithGoogle();
  Future<void> logout();

}
