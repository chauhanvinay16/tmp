import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class GlassKitScreen extends StatefulWidget {
  const GlassKitScreen({super.key});

  @override
  State<GlassKitScreen> createState() => _GlassKitScreenState();
}

class _GlassKitScreenState extends State<GlassKitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glass Kit'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GlassContainer(
          height: 200,
          width: 350,
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.40),
              Colors.white.withOpacity(0.10),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderGradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.60),
              Colors.white.withOpacity(0.10),
              Colors.purpleAccent.withOpacity(0.05),
              Colors.purpleAccent.withOpacity(0.60),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.39, 0.40, 1.0],
          ),
          blur: 20,
          borderRadius: BorderRadius.circular(24.0),
          borderWidth: 1.0,
          elevation: 3.0,
          isFrostedGlass: true,
          shadowColor: Colors.purple.withOpacity(0.20),
        ),
      ),
    );
  }
}
