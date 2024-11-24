import 'package:flutter/material.dart';

void main() {
  runApp(VotingApp());
}

class VotingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VotingPage(),
    );
  }
}

class VotingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting App'),
      ),
      body: VotingList(),
    );
  }
}

class VotingList extends StatelessWidget {
  // List of candidates (or any items you want to vote for)
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return VotingItem(title: items[index]);
      },
    );
  }
}

class VotingItem extends StatelessWidget {
  final String title;

  // Create a ValueNotifier for the vote count
  final ValueNotifier<int> voteCount = ValueNotifier<int>(0);

  VotingItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title of the item (e.g., candidate name)
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                // Button to add a vote
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    voteCount.value++; // Increment the vote count
                  },
                ),
                SizedBox(width: 8),
                // Display the current vote count using ValueListenableBuilder
                ValueListenableBuilder<int>(
                  valueListenable: voteCount,
                  builder: (context, value, child) {
                    return Text(
                      value.toString(),
                      style: TextStyle(fontSize: 18),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
