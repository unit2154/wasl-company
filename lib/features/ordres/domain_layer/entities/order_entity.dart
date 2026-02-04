import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/commission_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/customer_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/order_item_entity.dart';

class OrderEntity {
  final int id;
  final String orderNumber;
  final int endCustomerId;
  final int mainCustomerId;
  final String status;
  final String subtotal;
  final String totalAmount;
  final String commissionAmount;
  final String? trackingNumber;
  final String shippingAddress;
  final String? notes;
  final String? confirmedAt;
  final String? shippedAt;
  final String? deliveredAt;
  final String createdAt;
  final String? updatedAt;
  final CustomerEntity? endCustomer;
  final List<OrderItemEntity>? orderItems;
  final CommissionEntity? commission;

  OrderEntity({
    required this.id,
    required this.orderNumber,
    required this.endCustomerId,
    required this.mainCustomerId,
    required this.status,
    required this.subtotal,
    required this.totalAmount,
    required this.commissionAmount,
    this.trackingNumber,
    required this.shippingAddress,
    this.notes,
    this.confirmedAt,
    this.shippedAt,
    this.deliveredAt,
    required this.createdAt,
    this.updatedAt,
    this.endCustomer,
    this.orderItems,
    this.commission,
  });
}
