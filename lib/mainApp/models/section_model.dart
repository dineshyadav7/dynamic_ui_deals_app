import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SectionList {
  final List<SectionModel> sections;
  SectionList({required this.sections});
  factory SectionList.fromQuery(QuerySnapshot snapshot) => SectionList(
        sections: List<SectionModel>.from(
          snapshot.docs.map((doc) => SectionModel.fromJson(doc.data() as Map<String, dynamic>, doc.id)),
        ),
      );
}

class SectionModel {
  final String docId;
  final String title;
  final String ctaTitle;
  final String subTitle;
  final String titleColor;
  final double sequenceId;
  final String subTitleColor;
  final double titleFontSize;
  final String ctaTitleColor;
  final String titleFontWeight;
  final double ctaTitleFontSize;
  final double subTitleFontSize;
  final String subTitleFontWeight;
  final String ctaTitleFontWeight;

  SectionModel({
    required this.docId,
    required this.title,
    required this.ctaTitle,
    required this.subTitle,
    required this.titleColor,
    required this.sequenceId,
    required this.titleFontSize,
    required this.ctaTitleColor,
    required this.subTitleColor,
    required this.titleFontWeight,
    required this.ctaTitleFontSize,
    required this.subTitleFontSize,
    required this.subTitleFontWeight,
    required this.ctaTitleFontWeight,
  });

  factory SectionModel.fromJson(Map<String, dynamic> map, String docId) {
    return SectionModel(
      docId: docId,
      title: map['title'] ?? "",
      subTitle: map['subTitle'] ?? "",
      ctaTitle: map['ctaTitle'] ?? "",
      sequenceId: (map['sequenceId'] as num?)?.toDouble() ?? 0.0,
      titleColor: map['titleColor'] ?? "000000",
      titleFontSize: (map['titleFontSize'] as num?)?.toDouble() ?? 0.0,
      subTitleColor: map['subTitleColor'] ?? "000000",
      ctaTitleColor: map['ctaTitleColor'] ?? "000000",
      ctaTitleFontSize: (map['ctaTitleFontSize'] as num?)?.toDouble() ?? 0.0,
      subTitleFontSize: (map['subTitleFontSize'] as num?)?.toDouble() ?? 0.0,
      titleFontWeight: map['titleFontWeight'] ?? "normal",
      subTitleFontWeight: map['subTitleFontWeight'] ?? "normal",
      ctaTitleFontWeight: map['ctaTitleFontWeight'] ?? "normal",
    );
  }
}

getFontWeight(String fontWeight) {
  if (fontWeight.toLowerCase().contains("bold")) {
    return FontWeight.bold;
  } else {
    return FontWeight.normal;
  }
}
