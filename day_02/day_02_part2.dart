import 'dart:io';

List<String> invalidList = [];
void main() async {
  var file = File('day_02_input.txt');
  String id = await file.readAsString();
  String id1 = id.trim();
  List id2 = id1.split(',');
  List z;
  int x;
  int y;
  List m;
  String Digit;
  int count = 0;
  int firstValue;
  int secondValue;
  int totalInvalid = 0;
  for (int i = 0; i < id2.length; i++) {
    //get indivisual id from file
    z = id2[i].split('-');
    x = int.parse(z[0]);
    y = int.parse(z[1]);
    for (int j = x; j <= y; j++) {
      //loop in between x-y
      Digit = j.toString();
      // print(Digit); //indivisual digit in x-y
      m = multiples(Digit.length);
      for (int k = 0; k < m.length; k++) {
        checkPattern(Digit, m[k]);
      }
    }
  }
  List newInvalidList = invalidList.toSet().toList();
  int total = 0;
  for (int i = 0; i < newInvalidList.length; i++) {
    total += int.parse(newInvalidList[i]);
  }
  print(total);
}

List<int> multiples(int number) {
  List<int> temp = [];

  for (int i = 1; i < number; i++) {
    if (number % i == 0) {
      temp.add(i);
    }
  }
  return temp;
}

void checkPattern(String Digit, int index) {
  List<String> partDigit = [];
  int h1 = 0;
  int h2 = index;
  String trash;
  bool decision = false;
  String invalidNumber = "0";
  for (int l = 0; l < (Digit.length / index).toInt(); l++) {
    //add all the parts in a list
    partDigit.add(Digit.substring(h1, h2));
    h1 = h2;
    h2 = h2 + index;
  }

  trash = partDigit[0];
  for (int m = 1; m < partDigit.length; m++) {
    if (trash == partDigit[m])
      decision = true;
    else {
      decision = false;
      break;
    }
  }

  if (decision == true) {
    invalidNumber = Digit;
    invalidList.add(invalidNumber);
  }
}
