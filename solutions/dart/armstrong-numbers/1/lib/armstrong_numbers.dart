extension ExtendBigInt on BigInt {
  BigInt pow(int a) {
    BigInt result = BigInt.one;
    for (int i = 0; i < a; i++) result *= this;
    return result;
  }
}

class ArmstrongNumbers {
  bool isArmstrongNumber(var input) {
    BigInt number = BigInt.parse(input);
    int digits = input.length;
    BigInt result = BigInt.from(0);
    BigInt ten = BigInt.from(10);

    BigInt temp = number;
    while (temp != BigInt.zero) {
      BigInt digit = temp % ten;
      result += digit.pow(digits);
      temp ~/= ten;
    }

    print(result);
    
    return result == number;
  }
}
