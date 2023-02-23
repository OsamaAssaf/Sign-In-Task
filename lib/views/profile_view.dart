// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../model/user_model.dart';
import '../repository/facebook_auth/facebook_auth_api.dart';
import '../repository/google_auth/google_auth_api.dart';
import '../view_model/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key, required this.userModel, required this.isGoogle})
      : super(key: key);
  static const String routeName = '/profileView';
  final UserModel userModel;
  final bool isGoogle;

  final ProfileViewModel _viewModel = ProfileViewModel(
    googleAuthRepository: GoogleAuthApi(),
    facebookAuthRepository: FacebookAuthApi(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              if (isGoogle) {
                _viewModel.logout(context,isGoogle);
              } else {
                _viewModel.logout(context,isGoogle);
              }
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userModel.image != null && userModel.image!.isNotEmpty)
              CircleAvatar(
                foregroundImage: NetworkImage(userModel.image!),
              ),
            const SizedBox(height: 16.0),
            Text(userModel.name!),
            const SizedBox(height: 16.0),
            Text(userModel.email!),
          ],
        ),
      ),
    );
  }
}
