import 'package:assetwize/domain/entities/arts_item.dart';

class GetArtItemsUseCase {
  List<ArtItem> execute() {
    return [
      ArtItem(
        imagePath: "assets/images/house1.png",
        title: "Oil Painting",
        id: "ID: A001",
        detail: "Size: 24x36 inch",
        company: "Art Gallery",
      ),
      ArtItem(
        imagePath: "assets/images/house1.png",
        title: "Sculpture",
        id: "ID: S002",
        detail: "Material: Marble",
        company: "Museum Collection",
      ),
      ArtItem(
        imagePath: "assets/images/house1.png",
        title: "Watercolor Painting",
        id: "ID: W003",
        detail: "Size: 18x24 inch",
        company: "Local Artist",
      ),
    ];
  }
}
