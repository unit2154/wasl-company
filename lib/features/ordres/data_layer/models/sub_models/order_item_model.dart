import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/order_item_entity.dart';
import 'package:wasl_company_app/features/products/data_layer/models/product_model.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.id,
    required super.orderId,
    required super.itemId,
    required super.orderedQuantity,
    required super.confirmedQuantity,
    required super.unitPrice,
    required super.subtotal,
    required super.notes,
    required super.createdAt,
    required super.updatedAt,
    super.item,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      orderId: json['order_id'],
      itemId: json['item_id'],
      orderedQuantity: json['ordered_quantity'],
      confirmedQuantity: json['confirmed_quantity'],
      unitPrice: json['unit_price'],
      subtotal: json['subtotal'],
      notes: json['notes'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      item: json['item'] != null ? ProductModel.fromJson(json['item']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'item_id': itemId,
      'ordered_quantity': orderedQuantity,
      'confirmed_quantity': confirmedQuantity,
      'unit_price': unitPrice,
      'subtotal': subtotal,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'item': item?.toJson(),
    };
  }
}
