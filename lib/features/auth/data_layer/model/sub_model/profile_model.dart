import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  final String commissionSettlementType;
  final String commissionRate;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  ProfileModel({
    required super.id,
    required super.userId,
    required super.type,
    required super.name,
    required super.description,
    required super.address,
    required super.city,
    required super.country,
    required super.phone,
    required super.email,
    required this.commissionSettlementType,
    required this.commissionRate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      userId: json['user_id'],
      type: json['type'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      phone: json['phone'],
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
      'name': name,
      'description': description,
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
