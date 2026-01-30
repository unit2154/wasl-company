import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';

class UserModel extends UserEntity {
  final String type;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required super.id,
    required super.phone,
    required super.name,
    required super.email,
    required super.profile,
    required this.type,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      email: json['email'],
      profile: ProfileModel.fromJson(json['profile']),
      type: json['type'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'email': email,
      'profile': (profile as ProfileModel).toJson(),
      'type': type,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
