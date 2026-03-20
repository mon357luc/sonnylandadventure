class EggCounter {
  int count(int eggs){
    int n = 1, power = 0, result = 0;
    while (n <= eggs){
      n = n << 1;
      power++;
    }

    int twoRaised = 1 << power;
    
    for (int i = power; i >= 0; i--){
      if (twoRaised <= eggs) {
        eggs -= twoRaised;
        result++;
      }
      twoRaised = twoRaised >> 1;
    }
    return result;
  }
}
