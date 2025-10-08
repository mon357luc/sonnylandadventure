class Etl {
  Map<String, int> transform(Map<String, List<String>> legacy) {
    final result = new Map<String, int>();
    legacy.forEach((score, letters) {
      for (var letter in letters)
        result[letter.toLowerCase()] = int.parse(score);
    });
    return result;
  }
}
