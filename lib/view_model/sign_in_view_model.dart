// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../model/user_model.dart';
import '../repository/facebook_auth/facebook_auth_repository.dart';
import '../repository/google_auth/google_auth_repository.dart';
import '../views/profile_view.dart';

class SignInViewModel {
  final GoogleAuthRepository googleAuthRepository;
  final FacebookAuthRepository facebookAuthRepository;

  SignInViewModel({
    required this.googleAuthRepository,
    required this.facebookAuthRepository,
  });

  Future<void> signIn(BuildContext context, bool isGoogle)async{
    final NavigatorState navigator = Navigator.of(context);
    try {
      UserModel? userModel;
      if(isGoogle){
        userModel = await googleAuthRepository.signInWithGoogle();
      }else{
        userModel = await facebookAuthRepository.signInWithFacebook();
      }
      if (userModel == null) {
        throw 'Sign In Failed';
      }
      navigator.pushReplacementNamed(
        ProfileView.routeName,
        arguments: <String, dynamic>{
          'userModel': userModel,
          'isGoogle': isGoogle,
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign In Failed, Try again!'),
        ),
      );
    }
  }
}
