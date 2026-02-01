import 'package:hive/hive.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';

part '../../../../core/database/user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntity {
  final String type;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final ProfileModel profile;

  UserModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.phone,
    @HiveField(2) required super.name,
    @HiveField(3) required super.email,
    @HiveField(4) required this.type,
    @HiveField(5) required this.emailVerifiedAt,
    @HiveField(6) required this.createdAt,
    @HiveField(7) required this.updatedAt,
    @HiveField(8) required this.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      phone: json['phone'],
      name: json['name'],
      email: json['email'],
      profile: ProfileModel.fromJson(json['customer']),
      type: json['type'],
      emailVerifiedAt: json['email_verified_at'].toString(),
      createdAt: json['created_at'].toString(),
      updatedAt: json['updated_at'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'email': email,
      'customer': profile.toJson(),
      'type': type,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
