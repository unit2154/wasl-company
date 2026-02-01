import 'package:hive/hive.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/profile_entity.dart';

part '../../../../../core/database/profile_model.g.dart';

@HiveType(typeId: 2)
class ProfileModel extends ProfileEntity {
  final String commissionSettlementType;
  final String commissionRate;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  ProfileModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.userId,
    @HiveField(2) required super.type,
    @HiveField(3) required super.name,
    @HiveField(4) required super.description,
    @HiveField(5) required super.address,
    @HiveField(6) required super.city,
    @HiveField(7) required super.country,
    @HiveField(8) required super.phone,
    @HiveField(9) required super.email,
    @HiveField(10) required this.commissionSettlementType,
    @HiveField(11) required this.commissionRate,
    @HiveField(12) required this.isActive,
    @HiveField(13) required this.createdAt,
    @HiveField(14) required this.updatedAt,
    @HiveField(15) this.deletedAt,
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
      commissionRate: json['commission_rate'].toString(),
      isActive: json['is_active'] == 1 || json['is_active'] == true,
      createdAt: json['created_at'].toString(),
      updatedAt: json['updated_at'].toString(),
      deletedAt: json['deleted_at']?.toString(),
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
