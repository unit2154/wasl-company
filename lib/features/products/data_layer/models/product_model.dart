import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final ProfileModel profile;
  ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.sku,
    required super.price,
    required super.stockQuantity,
    required super.availabilityStatus,
    required super.images,
    required super.unit,
    required super.minOrderQuantity,
    required super.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.profile,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      sku: json['sku'],
      price: json['price'],
      stockQuantity: json['stock_quantity'],
      availabilityStatus: json['availability_status'],
      images: json['images'] ?? "",
      unit: json['unit'],
      minOrderQuantity: json['min_order_quantity'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'] ?? "",
      profile: ProfileModel.fromJson(json['customer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'sku': sku,
      'price': price,
      'stock_quantity': stockQuantity,
      'availability_status': availabilityStatus,
      'images': images,
      'unit': unit,
      'min_order_quantity': minOrderQuantity,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'customer': profile.toJson(),
    };
  }
}
