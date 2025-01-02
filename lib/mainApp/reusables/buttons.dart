import 'package:flutter/material.dart';

import '../models/content_model.dart';
import '../models/section_model.dart';
import 'colors.dart';
import 'snack_bar.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: grey),
      onPressed: () {
        showSnackBar(context, "This feature is under development");
      },
    );
  }
}

class CustomCTAButton extends StatelessWidget {
  const CustomCTAButton({
    super.key,
    this.width,
    required this.content,
  });
  final double? width;
  final ContentModel content;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? content.itemWidth,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: amber,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        onPressed: () {
          showSnackBar(context, "This feature is under development");
        },
        child: Text(
          "Rs ${content.itemCtaTitle}",
          style: TextStyle(
            fontSize: content.itemCtaTitleFontSize,
            fontWeight: getFontWeight(content.itemCtaTitleFontWeight),
            color: hex(content.itemCTATitleColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
