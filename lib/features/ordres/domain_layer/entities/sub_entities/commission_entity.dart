class CommissionEntity {
  final int id;
  final int orderId;
  final int customerId;
  final String amount;
  final String status;
  final String settlementType;
  final int? settlementId;
  final String settledAt;
  final String createdAt;
  final String updatedAt;

  CommissionEntity({
    required this.id,
    required this.orderId,
    required this.customerId,
    required this.amount,
    required this.status,
    required this.settlementType,
    this.settlementId,
    required this.settledAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
