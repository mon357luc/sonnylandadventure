extension extendsInt on int {
  int sq() => this * this;
}

class SquareRoot {
  int squareRoot(int input){
    if (input < 2) return input;

    int l = squareRoot(input >> 2) << 1;
    int r = l + 1;

    return r.sq() > input ? l : r;
  }
}
