import 'package:assetwize/data/models/asset_model.dart';

class AssetRepository {
  static final List<AssetModel> allAssets = [
    // Insurance
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Home Insurance",
      id: "Policy #4398564893456",
      detail: "Ends on: 02/09/2025",
      company: "ICICI",
      category: "Insurance",
    ),
    AssetModel(
      imagePath: "assets/images/life1.png",
      title: "Life Insurance",
      id: "Policy #4398564893457",
      detail: "Ends on: 02/09/2026",
      company: "ICICI",
      category: "Insurance",
    ),

    // Garage
    AssetModel(
      imagePath: "assets/images/car1.png",
      title: "Verna",
      id: "Model: MH12 AB 1234",
      detail: "Next Service: 12/03/2026",
      company: "DEC 2024",
      category: "Garage",
    ),
    AssetModel(
      imagePath: "assets/images/car2.png",
      title: "Royal Enfield",
      id: "MH14 CD 5678",
      detail: "Next Service: 21/08/2025",
      company: "Royal Enfield",
      category: "Garage",
    ),

    // Jewellery
    AssetModel(
      imagePath: "assets/images/ring1.png",
      title: "Ring",
      id: "Gold: 120 grams",
      detail: "Diamond: 20 carat",
      company: "",
      category: "Jewellery",
    ),
    AssetModel(
      imagePath: "assets/images/ring2.png",
      title: "Ring",
      id: "Silver: 120 grams",
      detail: "Diamond: 20 carat",
      company: "",
      category: "Jewellery",
    ),

    // Realty
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Apartment",
      id: "ID: A123",
      detail: "Size: 1200 sq ft",
      company: "ABC Realtors",
      category: "Realty",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Villa",
      id: "ID: V456",
      detail: "Size: 3500 sq ft",
      company: "XYZ Properties",
      category: "Realty",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Office Space",
      id: "ID: O789",
      detail: "Size: 5000 sq ft",
      company: "LMN Realty",
      category: "Realty",
    ),

    // Electronics
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Smart TV",
      id: "Model: TX123",
      detail: "Warranty: 2 years",
      company: "Samsung",
      category: "Electronics",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Laptop",
      id: "Model: LT456",
      detail: "Warranty: 1 year",
      company: "Dell",
      category: "Electronics",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Smartphone",
      id: "Model: SP789",
      detail: "Warranty: 1 year",
      company: "Apple",
      category: "Electronics",
    ),

    // Collectible
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Antique Coin",
      id: "ID: C001",
      detail: "Year: 1890",
      company: "Collector's Guild",
      category: "Collectible",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Rare Stamp",
      id: "ID: S002",
      detail: "Country: UK",
      company: "Philatelists Club",
      category: "Collectible",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Action Figurine",
      id: "ID: F003",
      detail: "Limited Edition",
      company: "Toy Collectors",
      category: "Collectible",
    ),

    // Arts
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Oil Painting",
      id: "ID: A001",
      detail: "Size: 24x36 inch",
      company: "Art Gallery",
      category: "Arts",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Sculpture",
      id: "ID: S002",
      detail: "Material: Marble",
      company: "Museum Collection",
      category: "Arts",
    ),
    AssetModel(
      imagePath: "assets/images/house1.png",
      title: "Watercolor Painting",
      id: "ID: W003",
      detail: "Size: 18x24 inch",
      company: "Local Artist",
      category: "Arts",
    ),
  ];
}
