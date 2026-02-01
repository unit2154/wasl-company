import 'package:hive/hive.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';

part "../../../../core/database/token_model.g.dart";

@HiveType(typeId: 1)
class TokenModel extends TokenEntity {
  TokenModel({@HiveField(0) required super.token});

  factory TokenModel.fromJson(dynamic json) {
    if (json is String) {
      return TokenModel(token: json);
    }
    return TokenModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
