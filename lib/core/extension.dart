import 'dart:core';

import 'package:flutter/material.dart';

extension Space on num {
  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());
}

extension MoneyParse on String {
  String moneyParse([bool isDot = false]) => _moneyParser(this, isDot);
}

String _moneyParser(String m, [bool isDot = true]) {
  int a = 0;
  String dot = isDot ? '.' : ' ';
  String minus = '';
  if (m.startsWith('-')) {
    minus = '-';
  }
  m = _toInt(m);
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

String _toInt(String s) {
  String integer = '';
  if (s.isNotEmpty) {
    for (int i = 0; i < s.length; i++) {
      if (_isNumeric(s[i])) {
        integer += s[i];
      }
    }
  }
  return integer;
}

final RegExp _numeric = RegExp(r'\d');

bool _isNumeric(String str) {
  return _numeric.hasMatch(str);
}

TextEditingValue moneyFormatter(String money) {
  String m = money;
  if (m.startsWith('00')) {
    m = m.substring(1, m.length);
  }
  if (m.length >= 2 && m.startsWith('0')) {
    m = m.substring(1, m.length);
  }
  if (m.replaceAll(' ', '').length >= 4) {
    m = _moneyParser(m.replaceAll(' ', ''), false);
  } else {
    m = _toInt(m);
  }
  return TextEditingValue(
      text: m, selection: TextSelection.collapsed(offset: m.length));
}