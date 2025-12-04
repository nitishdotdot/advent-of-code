import 'dart:io';

void main() async {
  int password1 = 0;
  int password2 = 0;
  int password;
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
        if (initialPoint == 100) {
          initialPoint = 0;
          if (rotateTo > 0) password2 += 1;
        }
      }
      if (initialPoint == 0) password1 += 1;
    } else {
      while (rotateTo > 0) {
        initialPoint = initialPoint - 1;
        rotateTo = rotateTo - 1;
        if (initialPoint == 0) {
          if (rotateTo > 0) password2 += 1;
        }
        if (initialPoint == -1) initialPoint = 99;
      }
      if (initialPoint == 0) {
        password1 += 1;
      }
    }
  }
  password = password1 + password2;
  print(password1);
  print(password2);
  print(password);
}
