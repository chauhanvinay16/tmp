import 'dart:async';

import 'package:flutter/material.dart';

class Streeem extends StatefulWidget {
  const Streeem({super.key});

  @override
  State<Streeem> createState() => _StreeemState();
}

class _StreeemState extends State<Streeem> {

  int _count=30;
  final StreamController<int> _streamController=StreamController<int>();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _starttimer();
  }

  _starttimer(){
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      if(_count>0){
        _count--;
        _streamController.add(_count);
      }else{
        _timer?.cancel();
      }
    },);
  }

  void dispos(){
    _timer?.cancel();
    _streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _streamController.stream,
            builder: (BuildContext context,AsyncSnapshot<int> snapshot) {
              if(snapshot.hasError){
                return Text("Error:${snapshot.error.toString()}");
              }else if(snapshot.hasData){
                 if(_count==0){
                   return TextButton(onPressed: () {
                     setState(() {
                       _count=30;
                     });
                     _starttimer();
                   }, child: Text('Resend OTP'));
                 }else{
                   return Text("Resend Otp in:${_count.toString()}");
                 }
              }else{
                return const CircularProgressIndicator();
              }
            },
        ),
      ),
    );
  }
}
