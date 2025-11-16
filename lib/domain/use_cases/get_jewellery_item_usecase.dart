import 'package:assetwize/domain/entities/jewellery_item.dart';

class GetJewelleryItemsUseCase {
  List<JewelleryItem> execute() {
    return [
      JewelleryItem(
        imagePath: "assets/images/ring1.png",
        title: "Ring",
        id: "Gold: 120 grams",
        detail: "Diamond: 20 carat",
        company: "",
      ),
      JewelleryItem(
        imagePath: "assets/images/ring2.png",
        title: "Ring",
        id: "Silver: 120 grams",
        detail: "Diamond: 20 carat",
        company: "",
      ),
    ];
  }
}
