import 'dart:async';
import 'dart:io';

void main() async {
  var file = File('day_06_input.txt');
  List<int> operatorIndex = [];
  List<String> myOperator = [];
  int totalsum = 0;
  int totalmul = 1;
  int gTotal = 0;
  late int total;
  String number = '';
  List<String> fileContent = await file.readAsLines();
  for (int i = 0; i < fileContent[fileContent.length - 1].length; i++) {
    if (fileContent[fileContent.length - 1].substring(i, i + 1) == "*" ||
        fileContent[fileContent.length - 1].substring(i, i + 1) == "+") {
      operatorIndex.add(i);
      myOperator.add(fileContent[fileContent.length - 1].substring(i, i + 1));
    }
  }
  operatorIndex.add(fileContent[0].length + 1);
  for (int i = 0; i < operatorIndex.length - 1; i++) {
    for (int k = operatorIndex[i]; k < operatorIndex[i + 1] - 1; k++) {
      for (int j = 0; j < fileContent.length - 1; j++) {
        number += fileContent[j].substring(k, k + 1);
      }

      if (myOperator[i] == "*") {
        totalmul *= int.parse(number.replaceAll(' ', ''));
        number = '';
      } else {
        totalsum += int.parse(number.replaceAll(' ', ''));
        number = '';
      }
    }
    total = totalmul > totalsum ? totalmul : totalsum;
    gTotal += total;
    totalmul = 1;
    totalsum = 0;
  }
  print(gTotal);
}
