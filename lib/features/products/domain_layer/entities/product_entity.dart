class ProductEntity {
  int id;
  String name;
  String description;
  String? sku;
  String price;
  int stockQuantity;
  String availabilityStatus;
  List<String>? images;
  String unit;
  String minOrderQuantity;
  bool isActive;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    this.sku,
    required this.price,
    required this.stockQuantity,
    required this.availabilityStatus,
    this.images,
    required this.unit,
    required this.minOrderQuantity,
    required this.isActive,
  });

  Map<String, dynamic> toJson() => {
    'customer_id': "1",
    'name': name,
    'description': description,
    'sku': sku,
    'price': price,
    'stock_quantity': stockQuantity,
    'availability_status': "available",
    'images': images,
    'unit': unit,
    'min_order_quantity': minOrderQuantity,
    'is_active': isActive ? 1 : 0,
  };
}
