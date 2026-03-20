class HighScores {
  List<int> scores;

  HighScores(this.scores);

  int latest() => this.scores.last;

  int personalBest() => this.scores.reduce((a, b) => a > b ? a : b);

  List<int> personalTopThree() {
    List<int> t3 = [0, 0, 0];

    for (int v in scores){
      if (v > t3[0]) t3.insert(0, v);
      else if (v > t3[1]) t3.insert(1, v);
      else if (v > t3[2]) t3.insert(2, v);
      
      if (t3.length == 4) t3.removeAt(3);

      print(t3);
    }

    t3.removeWhere((a) => a == 0);

    return t3;
  }

  
}
