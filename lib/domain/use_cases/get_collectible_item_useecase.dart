import 'package:assetwize/domain/entities/collectible_item.dart';

class GetCollectibleItemsUseCase {
  List<CollectibleItem> execute() {
    return [
      CollectibleItem(
        imagePath: "assets/images/house1.png",
        title: "Antique Coin",
        id: "ID: C001",
        detail: "Year: 1890",
        company: "Collector's Guild",
      ),
      CollectibleItem(
        imagePath: "assets/images/house1.png",
        title: "Rare Stamp",
        id: "ID: S002",
        detail: "Country: UK",
        company: "Philatelists Club",
      ),
      CollectibleItem(
        imagePath: "assets/images/house1.png",
        title: "Action Figurine",
        id: "ID: F003",
        detail: "Limited Edition",
        company: "Toy Collectors",
      ),
    ];
  }
}
