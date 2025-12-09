import 'dart:io';

void main() async {
  var file = File('day_05_input.txt');
  List<String> fileContent = await file.readAsLines();
  List<String> freshId = [];
  List<String> freshIdX = [];
  List<String> freshIdY = [];
  late int a;
  late int b;
  late int c;
  late int d;

  List<String> newfreshIdX = [];
  List<String> newfreshIdY = [];
  for (int i = 0; i < fileContent.length; i++) {
    if (fileContent[i] == '') {
      freshId = fileContent.sublist(0, i);
      break;
    }
  }

  for (int i = 0; i < freshId.length; i++) {
    for (int j = 0; j < freshId[i].length; j++) {
      if (fileContent[i].substring(j, j + 1) == '-') {
        freshIdX.add(freshId[i].substring(0, j));
        freshIdY.add(freshId[i].substring(j + 1));
        break;
      }
    }
  }
  String temp1;
  String temp2;
  for (int i = 0; i < freshId.length - 1; i++) //sorting part
    for (int j = i + 1; j < freshId.length; j++) {
      if (int.parse(freshIdX[i]) > int.parse(freshIdX[j])) {
        temp1 = freshIdX[i];
        freshIdX[i] = freshIdX[j];
        freshIdX[j] = temp1;
        temp2 = freshIdY[i];
        freshIdY[i] = freshIdY[j];
        freshIdY[j] = temp2;
      }
    }
  late int went;
  int greater;
  late int length;
  newfreshIdX = freshIdX;
  newfreshIdY = freshIdY;
  List<String> tempnewfreshIdX = [];
  List<String> tempnewfreshIdY = [];
  while (true) {
    int hasCome = 0;
    length = newfreshIdX.length;
    for (int i = 0; i < length - 1; i++) {
      a = int.parse(newfreshIdX[i]);
      b = int.parse(newfreshIdY[i]);
      c = int.parse(newfreshIdX[i + 1]);
      d = int.parse(newfreshIdY[i + 1]);
      if (c >= a && c <= b) {
        hasCome += 1;
        tempnewfreshIdX.add(a.toString());
        if (d > b) {
          greater = d;
        } else {
          greater = b;
        }
        tempnewfreshIdY.add(greater.toString());
        went = i + 1;
        i++;
      } else {
        tempnewfreshIdX.add(a.toString());
        tempnewfreshIdY.add(b.toString());
        went = i;
      }
    } //loop ends
    if (went == length - 2) {
      tempnewfreshIdX.add(newfreshIdX.last);
      tempnewfreshIdY.add(newfreshIdY.last);
    }
    went = 0;
    newfreshIdX = [...tempnewfreshIdX];
    newfreshIdY = [...tempnewfreshIdY];
    tempnewfreshIdX.clear();
    tempnewfreshIdY.clear();

    if (hasCome == 0) {
      break;
    }
  }

  int total = 0;
  for (int i = 0; i < newfreshIdX.length; i++) {
    total += int.parse(newfreshIdY[i]) - int.parse(newfreshIdX[i]) + 1;
  }
  print(total);
}
