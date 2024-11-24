import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliderExample(),
    );
  }
}

class SliderExample extends StatelessWidget {
  final ValueNotifier<double> sliderValue = ValueNotifier<double>(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<double>(
              valueListenable: sliderValue,
              builder: (context, value, child) {
                return Slider(
                  value: value,
                  onChanged: (newValue) {
                    sliderValue.value = newValue; // Update slider value
                  },
                  min: 0,
                  max: 1,
                  divisions: 10,
                );
              },
            ),
            ValueListenableBuilder<double>(
              valueListenable: sliderValue,
              builder: (context, value, child) {
                return Text(
                  'Slider value: ${(value * 100).toStringAsFixed(0)}%',
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
