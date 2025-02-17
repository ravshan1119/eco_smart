
String moneyParser(String m, [bool isDot = false]) {
  int a = 0;
  String dot = isDot ? '.' : ' ';
  String minus = '';
  if(m.startsWith('-')){
    minus = '-';
  }
  m = toInt(m);
  if (m.isNotEmpty) {
    if (m.length >= 4) {

      int index = m.length % 3;
      if (index == 0) {
        index = 3;
      }
      String money = m.length > 3 ? '${m.substring(0, index)}$dot' : m;
      for (int i = index; i < m.length; i++) {
        if (a % 3 == 0 && a != 0) {
          money += "$dot${m[i]}";
        } else {
          money += m[i];
        }
        a++;
      }
      return minus + money;
    } else {
      return minus + m;
    }
  } else {
    return '0';
  }
}

String toInt(String s) {
  String integer = '';
  if (s.isNotEmpty) {
    for (int i = 0; i < s.length; i++) {
      if (isNumeric(s[i])) {
        integer += s[i];
      }
    }
  }
  return integer;
}

final RegExp _numeric = RegExp(r'\d');

bool isNumeric(String str) {
  return _numeric.hasMatch(str);
}
