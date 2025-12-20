/*
  TODO:NOTE:
  - This model is intentionally kept minimal.
  - Getters and setters are NOT added because these are public nd final:
  - `toJson()` is NOT added because this only GET not POST or PUT:
  - Custom print methods are NOT added: Will ad dit if debugging needed
*/

class ProductModel {
  final int id;
  final String name;
  final String description;
  final int price;
  final String imagePath;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imagePath: json['image_path'],
    );
  }
}
