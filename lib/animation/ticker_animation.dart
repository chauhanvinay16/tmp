import 'package:flutter/material.dart';

class TickerAnimation extends StatefulWidget {
  const TickerAnimation({super.key});

  @override
  State<TickerAnimation> createState() => _TickerAnimationState();
}

class _TickerAnimationState extends State<TickerAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 4));
    animation=Tween(begin: 300.0,end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInCirc,
    ));

    animationController.addListener(() {
      print(animationController.value);
      setState(() {

      });
    },);
    super.initState();
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween animation'),
        backgroundColor: Colors.black12,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
              height: animation.value,
              width: animation.value,
              color: Colors.blueAccent,
        ),
      ),
    );
  }
}
