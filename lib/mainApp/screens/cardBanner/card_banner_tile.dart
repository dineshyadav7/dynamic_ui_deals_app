import 'package:flutter/material.dart';

import '../../models/content_model.dart';
import '../../models/section_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/network_image_view.dart';
import '../../reusables/sized_box_hw.dart';

class CardBannerTile extends StatelessWidget {
  const CardBannerTile({
    super.key,
    required this.cardBanner,
  });
  final ContentModel cardBanner;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: cardBanner.itemWidth,
        height: cardBanner.itemHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hex(cardBanner.itemBgColor),
              white.withOpacity(0.15),
              hex(cardBanner.itemBgColor),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: SizedBox(
            height: 85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NetworkImageView(
                  height: 50,
                  width: 50,
                  imageUrl: cardBanner.imageUrl,
                ),
                hb10,
                Text(
                  cardBanner.itemTitle,
                  style: TextStyle(
                    color: hex(cardBanner.itemTitleColor),
                    fontSize: cardBanner.itemTitleFontSize,
                    fontWeight: getFontWeight(cardBanner.itemTitleFontWeight),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          subtitle: SizedBox(
            width: cardBanner.itemWidth,
            child: Row(
              children: [
                Text(
                  cardBanner.itemSubTitle,
                  style: TextStyle(
                    color: hex(cardBanner.itemSubTitleColor),
                    fontSize: cardBanner.itemSubTitleFontSize,
                    fontWeight: getFontWeight(cardBanner.itemSubTitleFontWeight),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                wb8,
                Icon(
                  Icons.arrow_forward,
                  color: hex(cardBanner.itemSubTitleColor),
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
