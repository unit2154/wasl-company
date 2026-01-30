import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({required super.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
