import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Image Example'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images.jpg', // Replace with your image path
                height: 200, // Set height for portrait
              ),
              SizedBox(height: 20),
              Text('Portrait Mode', style: TextStyle(fontSize: 24)),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images.jpg', // Replace with your image path
                width: 300, // Set width for landscape
              ),
              SizedBox(width: 20),
              Text('Landscape Mode', style: TextStyle(fontSize: 24)),
            ],
          );
        },
      ),
    );
  }
}
