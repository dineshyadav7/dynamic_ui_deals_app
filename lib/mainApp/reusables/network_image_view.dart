import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({
    super.key,
    this.color,
    this.width,
    this.height,
    this.border,
    required this.imageUrl,
  });
  final Color? color;
  final double? height;
  final double? width;
  final double? border;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? white.withOpacity(0.2),
        border: Border.all(color: color != null ? white : white, width: border ?? 0),
        image: (imageUrl != ""
            ? DecorationImage(
                image: CachedNetworkImageProvider(imageUrl),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              )
            : null),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: SizedBox(),
      ),
    );
  }
}
