import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DynamicListExample(),
    );
  }
}

class DynamicListExample extends StatelessWidget {
  final ValueNotifier<List<String>> items = ValueNotifier<List<String>>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic List Example')),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: items,
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value[index]),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                items.value.add('Item ${items.value.length + 1}');
                items.notifyListeners(); // Notify listeners after adding new item
              },
              child: Text('Add Item'),
            ),
          ),
        ],
      ),
    );
  }
}
