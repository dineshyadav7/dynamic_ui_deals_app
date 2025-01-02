import 'package:flutter/material.dart';

import 'colors.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({
    super.key,
    this.message,
  });
  final String? message;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Center(
        child: Text(
          message ?? "Data not available !",
          style: const TextStyle(color: black),
        ),
      ),
    );
  }
}
