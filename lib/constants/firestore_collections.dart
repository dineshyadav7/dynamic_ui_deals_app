import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class CollectionNames {
  CollectionReference sectionsDb = db.collection("sections");
  CollectionReference contentsDb = db.collection("contents");
}
