class CustomerEntity {
  final int id;
  final String description;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String country;
  final String commissionSettlementType;
  final String commissionRate;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  CustomerEntity({
    required this.id,
    required this.description,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.country,
    required this.commissionSettlementType,
    required this.commissionRate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
