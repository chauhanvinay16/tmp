import 'dart:async';

class LiveScoresStream {
  final _controller = StreamController<Map<String, int>>();
  final _currentScores = <String, int>{};

  Stream<Map<String, int>> get stream => _controller.stream;

  void updateScore(String team, int score) {
    _currentScores[team] = score;
    _controller.add(_currentScores);
  }

  void dispose() {
    _controller.close();
  }
}