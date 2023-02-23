// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../repository/facebook_auth/facebook_auth_repository.dart';
import '../repository/google_auth/google_auth_repository.dart';
import '../views/sign_in_view.dart';

class ProfileViewModel {
  final GoogleAuthRepository googleAuthRepository;
  final FacebookAuthRepository facebookAuthRepository;

  ProfileViewModel({
    required this.googleAuthRepository,
    required this.facebookAuthRepository,
  });

  Future<void> logout(BuildContext context, bool isGoogle) async {
    final NavigatorState navigator = Navigator.of(context);
    try {
      if (isGoogle) {
        await googleAuthRepository.logout();
      } else {
        await facebookAuthRepository.logout();
      }

      navigator.pushReplacementNamed(SignInView.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logout Failed, Try again!'),
        ),
      );
    }
  }
}
