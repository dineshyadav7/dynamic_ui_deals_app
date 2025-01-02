import 'package:flutter/material.dart';

import '../../models/content_model.dart';
import '../../reusables/colors.dart';
import '../../reusables/network_image_view.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({
    super.key,
    required this.content,
  });
  final ContentModel content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NetworkImageView(
        width: content.itemWidth,
        height: content.itemHeight,
        imageUrl: content.imageUrl,
        color: hex(content.itemBgColor),
        border: content.itemBorder,
      ),
    );
  }
}
