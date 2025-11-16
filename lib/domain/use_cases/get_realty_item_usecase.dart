import 'package:assetwize/domain/entities/realty_items.dart';

class GetRealtyItemsUseCase {
  List<RealtyItem> execute() {
    return [
      RealtyItem(
        imagePath: "assets/images/house1.png",
        title: "Apartment",
        id: "ID: A123",
        detail: "Size: 1200 sq ft",
        company: "ABC Realtors",
      ),
      RealtyItem(
        imagePath: "assets/images/house1.png",
        title: "Villa",
        id: "ID: V456",
        detail: "Size: 3500 sq ft",
        company: "XYZ Properties",
      ),
      RealtyItem(
        imagePath: "assets/images/house1.png",
        title: "Office Space",
        id: "ID: O789",
        detail: "Size: 5000 sq ft",
        company: "LMN Realty",
      ),
    ];
  }
}
