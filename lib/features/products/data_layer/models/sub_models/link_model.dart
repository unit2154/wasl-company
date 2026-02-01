import 'package:wasl_company_app/features/products/domain_layer/entities/sub_entities/link_entity.dart';

class LinkModel extends LinkEntity {
  LinkModel({
    required String? url,
    required String label,
    required int? page,
    required bool active,
  }) : super(url: url, label: label, page: page, active: active);

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      url: json['url'],
      label: json['label'],
      page: json['page'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'label': label, 'page': page, 'active': active};
  }
}
