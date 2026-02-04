import 'package:wasl_company_app/features/ordres/data_layer/models/sub_models/commission_model.dart';
import 'package:wasl_company_app/features/ordres/data_layer/models/sub_models/customer_model.dart';
import 'package:wasl_company_app/features/ordres/data_layer/models/sub_models/order_item_model.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.endCustomerId,
    required super.mainCustomerId,
    required super.status,
    required super.createdAt,
    super.updatedAt,
    required super.orderNumber,
    required super.subtotal,
    required super.totalAmount,
    required super.commissionAmount,
    super.trackingNumber,
    required super.shippingAddress,
    super.notes,
    super.confirmedAt,
    super.shippedAt,
    super.deliveredAt,
    super.endCustomer,
    super.orderItems,
    super.commission,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderNumber: json['order_number'],
      endCustomerId: json['end_customer_id'],
      mainCustomerId: json['main_customer_id'],
      status: json['status'],
      subtotal: json['subtotal'],
      totalAmount: json['total_amount'],
      commissionAmount: json['commission_amount'],
      trackingNumber: json['tracking_number'],
      shippingAddress: json['shipping_address'],
      notes: json['notes'],
      confirmedAt: json['confirmed_at'],
      shippedAt: json['shipped_at'],
      deliveredAt: json['delivered_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      endCustomer: json['end_customer'] != null
          ? CustomerModel.fromJson(json['end_customer'])
          : null,
      orderItems: (json['order_items'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
    );
  }
}
