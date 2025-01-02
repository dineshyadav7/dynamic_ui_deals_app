import 'package:flutter/material.dart';

import '../models/section_model.dart';
import 'colors.dart';
import 'sized_box_hw.dart';

class SectionPageHeader extends StatelessWidget {
  const SectionPageHeader({
    super.key,
    this.action,
    this.type = 0,
    required this.section,
  });
  final int type;
  final SectionModel section;
  final void Function()? action;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: type == 0
          ? null
          : const CircleAvatar(
              backgroundColor: indigo,
              child: Icon(Icons.event, color: white),
            ),
      title: SectionTitle(section: section),
      subtitle: type == 0
          ? null
          : Text(
              section.subTitle,
              style: TextStyle(
                fontSize: section.subTitleFontSize,
                color: hex(section.subTitleColor),
                fontWeight: getFontWeight(section.subTitleFontWeight),
              ),
            ),
      trailing: TextButton(
        onPressed: action,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              section.ctaTitle,
              style: TextStyle(
                fontSize: section.ctaTitleFontSize,
                color: hex(section.ctaTitleColor),
                fontWeight: getFontWeight(section.ctaTitleFontWeight),
              ),
            ),
            wb4,
            Icon(
              Icons.arrow_forward,
              size: 15,
              color: black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.section,
  });

  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    return Text(
      section.title,
      style: TextStyle(
        color: hex(section.titleColor),
        fontWeight: getFontWeight(section.titleFontWeight),
        fontSize: section.titleFontSize,
      ),
    );
  }
}
