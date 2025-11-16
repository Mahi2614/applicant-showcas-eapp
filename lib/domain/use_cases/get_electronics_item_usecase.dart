import 'package:assetwize/domain/entities/electronics_item.dart';

class GetElectronicsItemsUseCase {
  List<ElectronicsItem> execute() {
    return [
      ElectronicsItem(
        imagePath: "assets/images/house1.png",
        title: "Smart TV",
        id: "Model: TX123",
        detail: "Warranty: 2 years",
        company: "Samsung",
      ),
      ElectronicsItem(
        imagePath: "assets/images/house1.png",
        title: "Laptop",
        id: "Model: LT456",
        detail: "Warranty: 1 year",
        company: "Dell",
      ),
      ElectronicsItem(
        imagePath: "assets/images/house1.png",
        title: "Smartphone",
        id: "Model: SP789",
        detail: "Warranty: 1 year",
        company: "Apple",
      ),
    ];
  }
}
