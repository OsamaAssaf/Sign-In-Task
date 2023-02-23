// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../repository/facebook_auth/facebook_auth_api.dart';
import '../repository/google_auth/google_auth_api.dart';
import '../view_model/sign_in_view_model.dart';
import '../widgets/sign_in_button.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  static const String routeName = '/signInView';

  final SignInViewModel _viewModel = SignInViewModel(
    googleAuthRepository: GoogleAuthApi(),
    facebookAuthRepository: FacebookAuthApi(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              title: 'Sign In With Google',
              image: 'assets/icons/google.png',
              onPressed: () async {
                await _viewModel.signIn(context,true);
              },
            ),
            const SizedBox(height: 16.0),
            SignInButton(
              title: 'Sign In With Facebook',
              image: 'assets/icons/facebook.png',
              onPressed: () async {
                await _viewModel.signIn(context,false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
