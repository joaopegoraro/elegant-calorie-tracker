String capitalize(String word) {
  final String firstLetter = word[0];
  return word.replaceFirst(RegExp(firstLetter), firstLetter.toUpperCase());
}
