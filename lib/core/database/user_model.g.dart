part of '../../features/auth/data_layer/model/user_model.dart';

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      id: reader.read(),
      phone: reader.read(),
      name: reader.read(),
      email: reader.read(),
      profile: reader.read(),
      type: reader.read(),
      emailVerifiedAt: reader.read(),
      createdAt: reader.read(),
      updatedAt: reader.read(),
      token: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.write(obj.id);
    writer.write(obj.phone);
    writer.write(obj.name);
    writer.write(obj.email);
    writer.write(obj.profile);
    writer.write(obj.type);
    writer.write(obj.emailVerifiedAt);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
    writer.write(obj.token);
  }
}
