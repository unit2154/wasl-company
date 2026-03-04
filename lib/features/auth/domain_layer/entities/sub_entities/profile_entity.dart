class ProfileEntity {
  final int id;
  final int userId;
  final String type;
  final String name;
  final String? description;
  final String? address;
  final String? city;
  final String? country;
  final String phone;
  final String email;

  ProfileEntity({
    required this.id,
    required this.userId,
    required this.type,
    required this.name,
    this.description,
    this.address,
    this.city,
    this.country,
    required this.phone,
    required this.email,
  });
}
