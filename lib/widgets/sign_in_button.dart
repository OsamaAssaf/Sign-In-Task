// Flutter imports:
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(
      {Key? key,
      required this.title,
      required this.image,
      required this.onPressed})
      : super(key: key);

  final String title;
  final String image;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
       fixedSize: const Size(240.0, 50.0),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Image.asset(
            image,
            height: 32.0,
            width: 32.0,
          ),
          const SizedBox(width: 16.0),
          Text(title),
        ],
      ),
    );
  }
}
