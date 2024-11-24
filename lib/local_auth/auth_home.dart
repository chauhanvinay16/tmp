import 'package:flutter/material.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({super.key});

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome to app',textScaleFactor: 3,),
      ),
    );
  }
}