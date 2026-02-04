import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';

class OrderItemEntity {
  final int id;
  final int orderId;
  final int itemId;
  final int orderedQuantity;
  final int confirmedQuantity;
  final String unitPrice;
  final String subtotal;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final ProductEntity? item;

  OrderItemEntity({
    required this.id,
    required this.orderId,
    required this.itemId,
    required this.orderedQuantity,
    required this.confirmedQuantity,
    required this.unitPrice,
    required this.subtotal,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.item,
  });
}
