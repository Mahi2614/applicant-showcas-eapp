import 'package:cloud_firestore/cloud_firestore.dart';

class InsuranceModel {
  final String id;
  final String title;
  final String detail;
  final String imageUrl;
  final String company;

  InsuranceModel({
    required this.id,
    required this.title,
    required this.detail,
    required this.imageUrl,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "detail": detail,
      "imageUrl": imageUrl,
      "company": company,
      "createdAt": Timestamp.now(),
    };
  }

  factory InsuranceModel.fromMap(Map<String, dynamic> map) {
    return InsuranceModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      company: map['company'] ?? "",
      detail: map['detail'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
    );
  }
}
