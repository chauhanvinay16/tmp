import 'package:flutter/material.dart';
import 'package:tmp/animation/hero/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HERO'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(),));
              },
              child: Hero(
                  tag: 'img',
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(image:
                  NetworkImage('https://img.freepik.com/premium-photo/pink-chameleon-with-green-background_542670-9681.jpg'))))))
        ],
      ),
    );
  }
}
