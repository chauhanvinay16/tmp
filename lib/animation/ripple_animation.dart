import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 4),lowerBound: 0.5);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ripple Animation'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: listRadius.map((radius) => Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(1.0 - _animation.value),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person_2_outlined),
          )).toList(),
        ),
      ),
    );
  }
}