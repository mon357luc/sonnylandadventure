extension extendInt on int {
  int sq() => this * this;
}

class DifferenceOfSquares {
  int sumOfSquares(int n) {
    return enumInt(n).map((v) => v.sq()).reduce((a, b) => a + b);
  }

  int squareOfSum(int n) {
    return enumInt(n).reduce((a, b) => a + b).sq();
  }

  int differenceOfSquares(int n) {
    return enumInt(n).reduce((a, b) => a + b).sq() - enumInt(n).map((v) => v.sq()).reduce((a, b) => a + b);
  }

  List<int> enumInt(int n) {
    List<int> result = [];
    while (n != 0) result.add(n--);
    return result;
  }
}
