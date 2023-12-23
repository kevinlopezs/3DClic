import 'package:flutter/material.dart';
import '../screens.dart';

class Login extends StatefulWidget {
  static const String name = 'login_screen.dart';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: const HomeScreen(),
    );
  }
}
