import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assetwize/data/models/insurance_model.dart';

class FirestoreServices {
  final _collection = FirebaseFirestore.instance.collection("insurance_items");

  Future<void> addInsurance(InsuranceModel model) async {
    await _collection.add(model.toMap());
  }

  Future<List<InsuranceModel>> fetchInsuranceItems() async {
    final snapshot = await _collection
        .orderBy("createdAt", descending: true)
        .get();

    return snapshot.docs
        .map((doc) => InsuranceModel.fromMap(doc.data()))
        .toList();
  }
}
