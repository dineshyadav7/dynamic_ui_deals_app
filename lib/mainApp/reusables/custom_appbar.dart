import 'package:flutter/material.dart';

import '../reusables/colors.dart';
import '../reusables/sized_box_hw.dart';
import 'buttons.dart';

class CutomAppBar extends StatelessWidget {
  const CutomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: appbarColor,
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomIconButton(icon: Icons.location_on_rounded),
                  wb8,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery to",
                        style: TextStyle(color: grey, fontSize: 14),
                      ),
                      Text(
                        "201301",
                        style: TextStyle(color: black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const Row(
                children: [
                  CustomIconButton(icon: Icons.search),
                  CustomIconButton(icon: Icons.favorite_border),
                  CustomIconButton(icon: Icons.shopping_cart_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
