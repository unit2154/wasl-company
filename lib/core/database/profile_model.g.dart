part of '../../features/auth/data_layer/model/sub_model/profile_model.dart';

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  int get typeId => 2;

  @override
  ProfileModel read(BinaryReader reader) {
    return ProfileModel(
      id: reader.read(),
      userId: reader.read(),
      type: reader.read(),
      name: reader.read(),
      description: reader.read(),
      address: reader.read(),
      city: reader.read(),
      country: reader.read(),
      phone: reader.read(),
      email: reader.read(),
      commissionSettlementType: reader.read(),
      commissionRate: reader.read(),
      isActive: reader.read(),
      createdAt: reader.read(),
      updatedAt: reader.read(),
      deletedAt: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer.write(obj.id);
    writer.write(obj.userId);
    writer.write(obj.type);
    writer.write(obj.name);
    writer.write(obj.description);
    writer.write(obj.address);
    writer.write(obj.city);
    writer.write(obj.country);
    writer.write(obj.phone);
    writer.write(obj.email);
    writer.write(obj.commissionSettlementType);
    writer.write(obj.commissionRate);
    writer.write(obj.isActive);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
    writer.write(obj.deletedAt);
  }
}
