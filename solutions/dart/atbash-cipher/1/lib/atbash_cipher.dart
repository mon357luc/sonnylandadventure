class AtbashCipher {
  final int maxCodeUnit = 'z'.codeUnitAt(0);
  final int minCodeUnit = 'a'.codeUnitAt(0);
  
  String encode(String plain){
    plain = plain.toLowerCase();

    String result = "";
    int count = 0;
    
    for (int i = 0; i < plain.length; i++) 
      if(isValidChar(plain[i]) || isValidNum(plain[i])) 
        result += getNewCodeUnit(plain[i]) + ((++count) % 5 == 0 ? " " : "");
    
    return result.trim();
  }

  String decode(String plain){
    plain = plain.toLowerCase();

    String result = "";
    
    for (int i = 0; i < plain.length; i++) 
      if(isValidChar(plain[i]) || isValidNum(plain[i])) 
        result += getNewCodeUnit(plain[i]);
    return result;
  }

  bool isValidChar(String char){
    return char.codeUnitAt(0) >= minCodeUnit && char.codeUnitAt(0) <= maxCodeUnit;
  }
  
  bool isValidNum(String char){
    return char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57;
  }

  String getNewCodeUnit (String char) {
    int varCodeUnit = maxCodeUnit + minCodeUnit;
    
    return varCodeUnit - char.codeUnitAt(0) <= maxCodeUnit ? String.fromCharCode(varCodeUnit - char.codeUnitAt(0)) : char;
  } 
}
