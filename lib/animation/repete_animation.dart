import 'package:flutter/material.dart';

class RepeatingFadeAnimationExample extends StatefulWidget {
  @override
  _RepeatingFadeAnimationExampleState createState() => _RepeatingFadeAnimationExampleState();
}

class _RepeatingFadeAnimationExampleState extends State<RepeatingFadeAnimationExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Repeat the animation indefinitely
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repeating Animation')),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RepeatingFadeAnimationExample(),
  ));
}
