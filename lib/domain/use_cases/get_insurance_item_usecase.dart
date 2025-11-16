import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assetwize/domain/entities/insurance_item.dart';

class GetInsuranceItemsUseCase {
  final collection = FirebaseFirestore.instance.collection("insurance_items");

  Future<List<InsuranceItem>> execute() async {
    //  --- Mock Data  ---
    List<InsuranceItem> mockItems = [
      InsuranceItem(
        imagePath: "assets/images/house1.png",
        title: "Home Insurance",
        id: "Policy #4398564893456",
        detail: "Ends on: 02/09/2025",
        company: "ICICI",
      ),
      InsuranceItem(
        imagePath: "assets/images/life1.png",
        title: "Life Insurance",
        id: "Policy #4398564893457",
        detail: "Ends on: 02/09/2026",
        company: "ICICI",
      ),
      InsuranceItem(
        imagePath: "assets/images/house1.png",
        title: "Home Insurance",
        id: "Policy #4398564893458",
        detail: "Ends on: 02/09/2027",
        company: "ICICI",
      ),
      InsuranceItem(
        imagePath: "assets/images/life1.png",
        title: "Life Insurance",
        id: "Policy #4398564893459",
        detail: "Ends on: 02/09/2028",
        company: "ICICI",
      ),
    ];

    final snapshot = await collection.get();

    List<InsuranceItem> firebaseItems = snapshot.docs.map((doc) {
      final data = doc.data();
      return InsuranceItem(
        imagePath: data['imageUrl'] ?? "",
        title: data['title'] ?? "",
        id: data['id'],
        detail: data['detail'] ?? "",
        company: data['company'] ?? "",
      );
    }).toList();

    return [...mockItems, ...firebaseItems];
  }
}
