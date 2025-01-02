import 'package:cloud_firestore/cloud_firestore.dart';

class ContentList {
  final List<ContentModel> contents;
  ContentList({required this.contents});
  factory ContentList.fromQuery(QuerySnapshot snapshot) => ContentList(
        contents: List<ContentModel>.from(
          snapshot.docs.map((doc) => ContentModel.fromMap(doc.data() as Map<String, dynamic>, doc.id)),
        ),
      );
}

class ContentModel {
  final String docId;
  final String imageUrl;
  final String itemTitle;
  final double itemWidth;
  final double itemHeight;
  final double sequenceId;
  final double itemBorder;
  final String itemBgColor;
  final String sequenceName;
  final String itemCtaTitle;
  final String itemSubTitle;
  final String itemTitleColor;
  final String scrollAlignment;
  final String itemSubTitleColor;
  final String itemCTATitleColor;
  final double itemTitleFontSize;
  final String highlitedAlignment;
  final String itemTitleFontWeight;
  final double itemCtaTitleFontSize;
  final double itemSubTitleFontSize;
  final String itemCtaTitleFontWeight;
  final String itemSubTitleFontWeight;

  ContentModel({
    required this.docId,
    required this.imageUrl,
    required this.itemTitle,
    required this.itemWidth,
    required this.itemHeight,
    required this.itemBorder,
    required this.sequenceId,
    required this.itemBgColor,
    required this.sequenceName,
    required this.itemSubTitle,
    required this.itemCtaTitle,
    required this.itemTitleColor,
    required this.scrollAlignment,
    required this.itemCTATitleColor,
    required this.itemSubTitleColor,
    required this.itemTitleFontSize,
    required this.highlitedAlignment,
    required this.itemTitleFontWeight,
    required this.itemSubTitleFontSize,
    required this.itemCtaTitleFontSize,
    required this.itemCtaTitleFontWeight,
    required this.itemSubTitleFontWeight,
  });
  factory ContentModel.fromMap(Map<String, dynamic> map, String docId) {
    return ContentModel(
      docId: docId,
      imageUrl: map['imageUrl'] ?? "",
      itemTitle: map['itemTitle'] ?? "",
      itemSubTitle: map['itemSubTitle'] ?? "",
      itemCtaTitle: map['itemCtaTitle'] ?? "",
      sequenceName: map['sequenceName'] ?? "",
      itemBgColor: map['itemBgColor'] ?? "000000",
      scrollAlignment: map['scrollAlignment'] ?? "",
      itemTitleColor: map['itemTitleColor'] ?? "000000",
      highlitedAlignment: map['highlitedAlignment'] ?? "",
      itemCTATitleColor: map['itemCTATitleColor'] ?? "000000",
      itemSubTitleColor: map['itemSubTitleColor'] ?? "000000",
      itemBorder: (map['itemBorder'] as num?)?.toDouble() ?? 1.0,
      itemWidth: (map['itemWidth'] as num?)?.toDouble() ?? 100.0,
      sequenceId: (map['sequenceId'] as num?)?.toDouble() ?? 0.0,
      itemTitleFontWeight: map['itemTitleFontWeight'] ?? "normal",
      itemHeight: (map['itemHeight'] as num?)?.toDouble() ?? 100.0,
      itemCtaTitleFontWeight: map['itemCtaTitleFontWeight'] ?? "normal",
      itemSubTitleFontWeight: map['itemSubTitleFontWeight'] ?? "normal",
      itemTitleFontSize: (map['itemTitleFontSize'] as num?)?.toDouble() ?? 0.0,
      itemSubTitleFontSize: (map['itemSubTitleFontSize'] as num?)?.toDouble() ?? 0.0,
      itemCtaTitleFontSize: (map['itemCtaTitleFontSize'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
