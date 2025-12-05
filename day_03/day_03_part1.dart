import 'dart:io';

void main() async {
  var file = File('day_03_input.txt');
  List<String> filecontent = await file.readAsLines();
  int a = 0;
  int b = 0;
  String firstCharacter;
  String secondCharacter;
  int totalJoltage = 0;
  int max = 0;
  List<int> joltage = [];
  for (int i = 0; i < filecontent.length; i++) {
    int h = filecontent[i].length;
    for (int j = 0; j < h - 1; j++) {
      firstCharacter = filecontent[i].substring(j, j + 1);
      a = int.parse(firstCharacter);
      for (int k = j + 1; k < h; k++) {
        secondCharacter = filecontent[i].substring(k, k + 1);
        b = int.parse(secondCharacter);
        joltage.add(a * 10 + b);
      }
    }
    for (int l = 0; l < joltage.length; l++) {
      if (joltage[l] > max) max = joltage[l];
    }
    totalJoltage += max;
    joltage = [];
    max = 0;
  }
  print(totalJoltage);
}
