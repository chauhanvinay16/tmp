import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Column(
        children: [
          Hero(
              tag: 'img',
          child: SizedBox(
              child: Image(image: NetworkImage('https://img.freepik.com/premium-photo/pink-chameleon-with-green-background_542670-9681.jpg'))))
        ],
      ),
    );
  }
}
