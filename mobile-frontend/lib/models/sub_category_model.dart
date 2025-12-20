/*
  TODO:NOTE:
  - This model is intentionally kept minimal.
  - Getters and setters are NOT added because these are public nd final:
  - `toJson()` is NOT added because this only GET not POST or PUT:
  - Custom print methods are NOT added: Will ad dit if debugging needed
*/

class SubCategoryModel {
  final String name;
  final int productCount;
  final String imageUrl;

  SubCategoryModel({
    required this.name,
    required this.productCount,
    required this.imageUrl,
  });

  factory SubCategoryModel.fromJson(
      Map<String, dynamic> json, {
        required String imageUrl,
      }) {
    return SubCategoryModel(
      name: json['sub_category'] as String,
      productCount: json['product_count'] as int,
      imageUrl: imageUrl,
    );
  }
}

