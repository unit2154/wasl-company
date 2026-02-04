import 'package:wasl_company_app/core/models/link_model.dart';
import 'package:wasl_company_app/features/ordres/data_layer/models/order_model.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/orders_list_entity.dart';

class OrdersListModel extends OrdersListEntity {
  OrdersListModel({
    required super.currentPage,
    super.orders,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    super.links,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });

  factory OrdersListModel.fromJson(Map<String, dynamic> json) {
    return OrdersListModel(
      currentPage: json['current_page'],
      orders: (json['data']! as List)
          .map((e) => OrderModel.fromJson(e))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'] ?? 0,
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links']! as List)
          .map((e) => LinkModel.fromJson(e))
          .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'] ?? "",
      to: json['to'] ?? 0,
      total: json['total'],
    );
  }
}
