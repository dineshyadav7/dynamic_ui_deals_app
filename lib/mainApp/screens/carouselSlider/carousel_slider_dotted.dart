import 'package:flutter/material.dart';

import '../../reusables/colors.dart';


class CarouselSliderDotted extends StatelessWidget {
  const CarouselSliderDotted({
    super.key,
    required this.bannerLength,
    required this.currentCarouselIndex,
  });
  final int bannerLength;
  final int currentCarouselIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          bannerLength,
          (index) => Container(
            margin: const EdgeInsets.only(right: 5),
            height: 8,
            width: index == currentCarouselIndex ? 25 : 8,
            decoration: BoxDecoration(
              color: index == currentCarouselIndex ? grey : grey.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      ),
    );
  }
}
