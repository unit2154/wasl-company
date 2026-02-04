import 'package:wasl_company_app/core/entites/link_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';

class OrdersListEntity {
  final int currentPage;
  final List<OrderEntity>? orders;
  final String firstPageUrl;
  final int? from;
  final int lastPage;
  final String lastPageUrl;
  final List<LinkEntity>? links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int? to;
  final int total;

  OrdersListEntity({
    required this.currentPage,
    this.orders,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });
}
