class CollatzConjecture {
  bool isEven(int n) => n & 1 == 0;

  int steps (int n) {
    if (n < 1) throw ArgumentError('Only positive integers are allowed');
    int count = 0;
    while (n != 1) {
      if (isEven(n))
        n = n >> 1;
      else
        n = 3 * n + 1;
      count++;
    }
    return count;
  }
}
