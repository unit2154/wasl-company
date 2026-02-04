import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/commission_entity.dart';

class CommissionModel extends CommissionEntity {
  CommissionModel({
    required super.id,
    required super.orderId,
    required super.customerId,
    required super.amount,
    required super.status,
    required super.settlementType,
    super.settlementId,
    required super.settledAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CommissionModel.fromJson(Map<String, dynamic> json) {
    return CommissionModel(
      id: json['id'],
      orderId: json['order_id'],
      customerId: json['customer_id'],
      amount: json['amount'],
      status: json['status'],
      settlementType: json['settlement_type'],
      settlementId: json['settlement_id'],
      settledAt: json['settled_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
