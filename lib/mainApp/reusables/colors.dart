import 'package:flutter/material.dart';

const Color none = Colors.transparent;
const Color black = Colors.black;
const Color white = Colors.white;
const Color indigo = Colors.indigo;
const Color orange = Colors.orange;
const Color green = Colors.green;
const Color amber = Colors.amber;
const Color blueGrey = Colors.blueGrey;
const Color grey = Colors.grey;
const Color appbarColor = Color(0xFFf9f9f9);

//get color from hexadecimal
Color hex(String hex) {
  return Color(int.parse("0xFF${hex.toUpperCase()}"));
}
