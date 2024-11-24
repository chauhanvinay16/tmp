import 'package:flutter/material.dart';

import 'live_scores_stream.dart';

class Scrore extends StatefulWidget {
  const Scrore({super.key});

  @override
  State<Scrore> createState() => _ScroreState();
}

class _ScroreState extends State<Scrore> {

  final _liveScoresStream = LiveScoresStream();

  @override
  void dispose() {
    _liveScoresStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Scores Example'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _liveScoresStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final data = snapshot.data; // Get the data from the snapshot
              if (data != null) { // Check if data is not null
                return ListView.builder(
                  itemCount: data.length, // Now it's safe to access length
                  itemBuilder: (context, index) {
                    final team = data.keys.elementAt(index); // Now it's safe to access keys
                    final score = data[team]; // Now it's safe to access the value using []
                    return ListTile(
                      title: Text('$team: $score'),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator(); // Return a loading indicator if data is null
              }
            } else {
              return CircularProgressIndicator(); // Return a loading indicator if snapshot has no data
            }
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _liveScoresStream.updateScore('Team A', 40);
          _liveScoresStream.updateScore('Team B', 10);
        },
        tooltip: 'Update Scores',
        child: Icon(Icons.update),
      ),
    );
  }
}
