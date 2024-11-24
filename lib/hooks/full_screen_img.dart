import 'package:flutter/material.dart';

class FullScreenImg extends StatelessWidget {
  final String image;
  const FullScreenImg({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: InteractiveViewer(
            child: Image.network(
            image,
            fit: BoxFit.contain,
                    ),
          ),
        ),
      ),
    );
  }
}
