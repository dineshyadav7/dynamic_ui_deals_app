import 'package:flutter/material.dart';

import '../../models/content_model.dart';
import '../../models/section_model.dart';
import '../../reusables/colors.dart';

class CategoryHighlighted extends StatelessWidget {
  const CategoryHighlighted({
    super.key,
    required this.category,
  });
  final ContentModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: category.itemSubTitle.toLowerCase().contains("new") ? green : orange,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
          child: Text(
            category.itemSubTitle.toUpperCase(),
            style: TextStyle(
              color: white,
              fontSize: category.itemSubTitleFontSize,
              fontWeight: getFontWeight(category.itemSubTitleFontWeight),
            ),
          ),
        ),
      ),
    );
  }
}
