import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LotteScreen extends StatefulWidget {
  const LotteScreen({super.key});

  @override
  State<LotteScreen> createState() => _LotteScreenState();
}

class _LotteScreenState extends State<LotteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lotte animation'),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/boy.json',
          height: 300,
          width: 300,
          fit: BoxFit.cover,
          repeat: true,
          reverse: true,
        ),
      ),
    );
  }
}