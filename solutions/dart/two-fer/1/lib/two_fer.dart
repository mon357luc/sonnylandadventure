String twoFer([String? name]) {
  String output = (name == null ? "One for you, one for me." : "One for ${name}, one for me.");

  print(output);

  return output;
}
