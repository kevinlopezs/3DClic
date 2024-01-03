import 'package:flutter/material.dart';
import '../screens.dart';

class SignIn extends StatefulWidget {
  static const String name = 'login_screen.dart';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: const HomeScreen(),
    );
  }
}
