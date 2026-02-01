class ProductEntity {
  int id;
  String name;
  String description;
  String sku;
  String price;
  int stockQuantity;
  String availabilityStatus;
  String images;
  String unit;
  String minOrderQuantity;
  bool isActive;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.price,
    required this.stockQuantity,
    required this.availabilityStatus,
    required this.images,
    required this.unit,
    required this.minOrderQuantity,
    required this.isActive,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'sku': sku,
    'price': price,
    'stockQuantity': stockQuantity,
    'availabilityStatus': availabilityStatus,
    'images': images,
    'unit': unit,
    'minOrderQuantity': minOrderQuantity,
    'isActive': isActive,
  };
}
