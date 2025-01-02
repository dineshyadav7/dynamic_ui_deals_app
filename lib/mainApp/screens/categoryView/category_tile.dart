import 'package:flutter/material.dart';

import '../../models/content_model.dart';
import '../../models/section_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/network_image_view.dart';
import '../../reusables/sized_box_hw.dart';
import 'category_high_lighted.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });
  final ContentModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Column(
            children: [
              Visibility(
                visible: category.highlitedAlignment.toLowerCase().contains("top"),
                child: CategoryHighlighted(category: category),
              ),
              hb6,
              NetworkImageView(
                imageUrl: category.imageUrl,
                width: category.itemWidth,
                height: category.itemHeight - 20,
              ),
            ],
          ),
        ),
        Text(
          category.itemTitle,
          style: TextStyle(
            color: hex(category.itemTitleColor),
            fontSize: category.itemTitleFontSize,
            fontWeight: getFontWeight(category.itemTitleFontWeight),
          ),
        ),
        hb10,
        Visibility(
          visible: category.highlitedAlignment.toLowerCase().contains("bottom"),
          child: CategoryHighlighted(category: category),
        ),
      ],
    );
  }
}
