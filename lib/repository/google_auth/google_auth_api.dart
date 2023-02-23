// Package imports:
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import '../../model/user_model.dart';
import 'google_auth_repository.dart';

class GoogleAuthApi extends GoogleAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<void> logout() async{
    await _googleSignIn.disconnect();
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    UserModel? userModel;
    GoogleSignInAccount? userData = await _googleSignIn.signIn();
    if (userData != null) {
      Map<String, dynamic> data = {
        'name': userData.displayName,
        'email': userData.email,
        'image': userData.photoUrl,
      };
      userModel = UserModel.fromJson(data);
    }
    return userModel;
  }

}
