class GameOfLife {
  final List<List<int>> board;
  late final tick_board;

  List<(int, int)> tests = [
    (-1, -1),
    (-1, 0),
    (-1, 1),
    (0, -1),
    (0, 1),
    (1, -1),
    (1, 0),
    (1, 1)
  ];

  GameOfLife(this.board) {
    tick_board = List.generate(
      board.length,
      (i) => List.filled(board[i].length, 0),
    );
  }

  void tick() {
    int max_row = board.length;
    
    for(int i = 0; i < max_row; i ++){
      int max_col = board[i].length;
      
      for(int j = 0; j < max_col; j++){
        
        int live_n = 0;

        for (var (x, y) in tests){
          int test_i = i + x, test_j = j + y;
          if (test_i < 0) continue; 
          if (test_j < 0) continue; 
          if (test_i == max_row) continue; 
          if (test_j == max_col) continue;
          if (board[test_i][test_j] == 1) live_n++;
        };

        if (live_n == 3) {
          tick_board[i][j] = 1;
        } else if (live_n == 2 && board[i][j] == 1) {
          tick_board[i][j] = 1;
        } 
      }
    }
  }

  List<List<int>> matrix() => tick_board;
}
