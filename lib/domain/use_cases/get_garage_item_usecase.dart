import 'package:assetwize/domain/entities/garage_item.dart';

class GetGarageItemsUseCase {
  List<GarageItem> execute() {
    return [
      GarageItem(
        imagePath: "assets/images/car1.png",
        title: "Verna",
        id: "Model: MH12 AB 1234",
        detail: "Next Service: 12/03/2026",
        company: "DEC 2024",
      ),
      GarageItem(
        imagePath: "assets/images/car2.png",
        title: "Royal Enfield",
        id: "MH14 CD 5678",
        detail: "Next Service: 21/08/2025",
        company: "Royal Enfield",
      ),
    ];
  }
}
