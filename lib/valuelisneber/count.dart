import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToggleSwitchExample(),
    );
  }
}

class ToggleSwitchExample extends StatelessWidget {
  final ValueNotifier<bool> isSwitched = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toggle Switch Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: isSwitched,
              builder: (context, value, child) {
                return Switch(
                  value: value,
                  onChanged: (newValue) {
                    isSwitched.value = newValue; // Update the switch state
                  },
                );
              },
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: isSwitched,
              builder: (context, value, child) {
                return Text(
                  value ? 'Switch is ON' : 'Switch is OFF',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
