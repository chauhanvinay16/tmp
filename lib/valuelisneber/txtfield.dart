import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFieldExample(),
    );
  }
}

class TextFieldExample extends StatelessWidget {
  final ValueNotifier<String> inputText = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (newValue) {
                inputText.value = newValue; // Update text as user types
              },
              decoration: InputDecoration(
                labelText: 'Enter something',
              ),
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<String>(
              valueListenable: inputText,
              builder: (context, value, child) {
                return Text(
                  'You typed: $value',
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
