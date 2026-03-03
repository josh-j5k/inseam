import 'package:flutter/material.dart';

Color colorFromHashCode(Object data) {
  const colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
  ];
  return colors[data.hashCode.abs() % colors.length];
}
