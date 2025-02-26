class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  String? imageUrl;
  int? stockQuantity;
  String? category;
  List<String>? tags;
  double? rating;
  bool isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.stockQuantity,
    this.category,
    this.tags,
    this.rating,
    this.isFeatured = false,
    this.createdAt,
    this.updatedAt,
  });

  // Method to convert a Product from a JSON object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      stockQuantity: json['stockQuantity'],
      category: json['category'],
      tags: List<String>.from(json['tags']),
      rating: json['rating'].toDouble(),
      isFeatured: json['isFeatured'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Method to convert a Product to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'stockQuantity': stockQuantity,
      'category': category,
      'tags': tags,
      'rating': rating,
      'isFeatured': isFeatured,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  Map<String, dynamic> toSaveUnSaveJson() {
    return {
      'id': id,
    };
  }
}
