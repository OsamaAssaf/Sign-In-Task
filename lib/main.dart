// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'views/profile_view.dart';
import 'views/sign_in_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sing In Task',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 16.0,
          shadowColor: Colors.black26,
          backgroundColor: Colors.blue,
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: SignInView.routeName,
      routes: {
        SignInView.routeName: (_) => SignInView(),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case ProfileView.routeName:
            Map<String, dynamic> args =
                settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) {
                return ProfileView(
                  userModel: args['userModel'],
                  isGoogle: args['isGoogle'],
                );
              },
            );
        }
        return null;
      },
    );
  }
}
