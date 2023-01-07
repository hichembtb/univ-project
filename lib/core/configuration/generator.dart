import 'dart:math';

class Generator {
  List letters = [
    "a",
    "z",
    "e",
    "r",
    "t",
    "y",
    "u",
    "i",
    "o",
    "p",
    "q",
    "s",
    "d",
    "f",
    "g",
    "h",
    "j",
    "k",
    "l",
    "m",
    "w",
    "x",
    "c",
    "v",
    "b",
    "n",
  ];
  List numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  String generateId() {
    final random = Random();
    String letter = letters[random.nextInt(letters.length)];
    String upperletter = letters[random.nextInt(letters.length)];
    int number = numbers[random.nextInt(numbers.length)];
    String secletter = letters[random.nextInt(letters.length)];
    String secupperletter = letters[random.nextInt(letters.length)];
    int secnumber = numbers[random.nextInt(numbers.length)];
    return "${upperletter.toUpperCase()}$letter$number${secupperletter.toUpperCase()}$secletter$secnumber";
  }
}
