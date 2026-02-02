import 'package:wasl_company_app/features/products/domain_layer/entities/sub_entities/link_entity.dart';

class LinkModel extends LinkEntity {
  LinkModel({
    required super.url,
    required super.label,
    required super.page,
    required super.active,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      url: json['url'] ?? "",
      label: json['label'],
      page: json['page'] ?? 0,
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'label': label, 'page': page, 'active': active};
  }
}
