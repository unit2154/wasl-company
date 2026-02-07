import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/profile_entity.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final ProfileEntity profile;
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profile,
  });
}
