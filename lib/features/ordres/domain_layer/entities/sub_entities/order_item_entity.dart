import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';

class OrderItemEntity {
  int id;
  int orderId;
  int itemId;
  int orderedQuantity;
  int confirmedQuantity;
  String unitPrice;
  String subtotal;
  String? notes;
  String createdAt;
  String updatedAt;
  ProductEntity? item;

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
