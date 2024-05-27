import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        radius: 100,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage("assets/images/cooker1.png"),
      ),
    );
  }
}
