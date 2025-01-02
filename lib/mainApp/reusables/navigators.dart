import 'package:flutter/material.dart';

Future<dynamic> pushSimple(BuildContext context, Widget newScreen) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}
