class Proverb {
  String recite(List<String> pieces) {
    if (pieces.length == 0) return "";

    int cnt = pieces.length;
    String result = "";

    for (int i = cnt; i > 1; i--){
      result += 'For want of a ${pieces.elementAt(cnt - i)} the ${pieces.elementAt(cnt - i + 1)} was lost.\n';
    }

    result += 'And all for the want of a ${pieces.first}.';
    return result;
  }
}
