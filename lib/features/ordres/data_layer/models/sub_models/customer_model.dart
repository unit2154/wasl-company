import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  final int userId;
  final String type;
  final String? deletedAt;

  CustomerModel({
    required super.id,
    required this.userId,
    required this.type,
    required super.description,
    required super.name,
    required super.phone,
    required super.address,
    required super.city,
    required super.country,
    required super.email,
    required super.commissionSettlementType,
    required super.commissionRate,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    this.deletedAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      userId: json['user_id'],
      type: json['type'],
      description: json['description'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      email: json['email'],
      commissionSettlementType: json['commission_settlement_type'],
      commissionRate: json['commission_rate'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type,
      'description': description,
      'name': name,
      'address': address,
      'city': city,
      'country': country,
      'phone': phone,
      'email': email,
      'commission_settlement_type': commissionSettlementType,
      'commission_rate': commissionRate,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
