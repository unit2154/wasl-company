import 'package:hive/hive.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/token_model.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';

part '../../../../core/database/user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntity {
  final String type;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  UserModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.phone,
    @HiveField(2) required super.name,
    @HiveField(3) required super.email,
    @HiveField(4) required this.type,
    @HiveField(5) required this.emailVerifiedAt,
    @HiveField(6) required this.createdAt,
    @HiveField(7) required this.updatedAt,
    @HiveField(8) required super.profile,
    @HiveField(9) required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'].toString(),
      phone: json['user']['phone'],
      name: json['user']['name'],
      email: json['user']['email'],
      profile: ProfileModel.fromJson(json['user']['customer']),
      type: json['user']['type'],
      emailVerifiedAt: json['user']['email_verified_at'].toString(),
      createdAt: json['user']['created_at'].toString(),
      updatedAt: json['user']['updated_at'].toString(),
      token: TokenModel.fromJson(json['token']),
    );
  }

  Map<String, Map<String, dynamic>> toJson() {
    return {
      'user': {
        'id': id,
        'phone': phone,
        'name': name,
        'email': email,
        'customer': (profile as ProfileModel).toJson(),
        'type': type,
        'email_verified_at': emailVerifiedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
      },
      'token': (token as TokenModel).toJson(),
    };
  }
}
