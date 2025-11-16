class AssetModel {
  final String id;
  final String title;
  final String imagePath;
  final String company;
  final String detail;
  final String category;

  AssetModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.company,
    required this.detail,
    required this.category,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'imagePath': imagePath,
    'company': company,
    'detail': detail,
    'category': category,
  };

  factory AssetModel.fromMap(Map<String, dynamic> map) => AssetModel(
    id: map['id'],
    title: map['title'],
    imagePath: map['imagePath'],
    company: map['company'],
    detail: map['detail'],
    category: map['category'],
  );
}
