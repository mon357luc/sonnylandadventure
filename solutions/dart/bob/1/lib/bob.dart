class Bob {
  String response (String dialog) {
    dialog = dialog.trim();

    bool isQ = isQuestion(dialog);
    
    if (isWhitespace(dialog))
      return "Fine. Be that way!";
    else if (isYelling(dialog))
      return isQ ? "Calm down, I know what I'm doing!" : "Whoa, chill out!";
    else if (isQ)
      return "Sure.";
    else
      return "Whatever.";
  }

  bool isWhitespace (String silence) => silence.replaceAll(RegExp(r'\s+'), '').isEmpty;
  bool isYelling (String shout) => containsAlpha(shout) && shout == shout.toUpperCase();
  bool isQuestion (String question) => question.isNotEmpty && question[question.length - 1] == '?';
  bool containsAlpha (String str) => RegExp(r'[a-zA-Z]').hasMatch(str);
}
