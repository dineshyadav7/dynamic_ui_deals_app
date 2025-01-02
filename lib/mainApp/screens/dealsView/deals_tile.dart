import 'package:flutter/material.dart';

import '../../models/content_model.dart';
import '../../models/section_model.dart';
import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/network_image_view.dart';
import '../../reusables/sized_box_hw.dart';

class DealsTile extends StatelessWidget {
  const DealsTile({
    super.key,
    required this.tileHeight,
    required this.deal,
  });
  final double tileHeight;
  final ContentModel deal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 230,
        height: tileHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NetworkImageView(
                width: deal.itemWidth,
                height: 150,
                imageUrl: deal.imageUrl,
                color: hex(deal.itemBgColor),
                border: deal.itemBorder,
              ),
            ),
            hb20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                deal.itemTitle,
                style: TextStyle(
                  fontSize: deal.itemTitleFontSize,
                  fontWeight: getFontWeight(deal.itemTitleFontWeight),
                  color: hex(deal.itemTitleColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            hb20,
            CustomCTAButton(content: deal),
          ],
        ),
      ),
    );
  }
}
