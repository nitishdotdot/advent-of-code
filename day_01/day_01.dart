import 'dart:io';

void main() async {
  int password = 0;
  int initialPoint = 50;
  List items = [];
  var file = File('day_01_input.txt');
  List filecontent = await file.readAsLines();
  items = filecontent;
  for (int i = 0; i < items.length; i++) {
    int rotateTo = int.parse(items[i].substring(1));
    if (items[i][0] == 'R') {
      while (rotateTo > 0) {
        initialPoint = initialPoint + 1;
        rotateTo = rotateTo - 1;
        if (initialPoint == 100) initialPoint = 0;
      }
      if (initialPoint == 0) password += 1;
    } else {
      while (rotateTo > 0) {
        initialPoint = initialPoint - 1;
        rotateTo = rotateTo - 1;
        if (initialPoint == -1) initialPoint = 99;
      }
      if (initialPoint == 0) password += 1;
    }
  }
  print(password);
}
