import 'dart:async';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class JwtTokenPage extends StatefulWidget {
  @override
  _JwtTokenPageState createState() => _JwtTokenPageState();
}

class _JwtTokenPageState extends State<JwtTokenPage> {
  String _jwtToken = '';
  bool _isTokenExpired = false;

  @override
  void initState() {
    super.initState();
    _generateJwtToken();
  }

  void _generateJwtToken() {
    final jwtToken = faker.jwt.valid(expiresIn: DateTime.now().add(Duration(seconds: 3)));
    setState(() {
      _jwtToken = jwtToken;
    });

    // Set a timer to check if the token has expired
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isTokenExpired = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JWT Token Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_jwtToken),
            _isTokenExpired
                ? Text('Your JWT token has expired!', style: TextStyle(color: Colors.red))
                : Container(),
          ],
        ),
      ),
    );
  }
}