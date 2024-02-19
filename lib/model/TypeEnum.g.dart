// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TypeEnum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeEnumAdapter extends TypeAdapter<TypeEnum> {
  @override
  final int typeId = 2;

  @override
  TypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypeEnum.banking;
      case 1:
        return TypeEnum.hard_working;
      case 2:
        return TypeEnum.meditate;
      case 3:
        return TypeEnum.social_friends;
      case 4:
        return TypeEnum.work_meeting;
      case 5:
        return TypeEnum.workout;
      default:
        return TypeEnum.banking;
    }
  }

  @override
  void write(BinaryWriter writer, TypeEnum obj) {
    switch (obj) {
      case TypeEnum.banking:
        writer.writeByte(0);
        break;
      case TypeEnum.hard_working:
        writer.writeByte(1);
        break;
      case TypeEnum.meditate:
        writer.writeByte(2);
        break;
      case TypeEnum.social_friends:
        writer.writeByte(3);
        break;
      case TypeEnum.work_meeting:
        writer.writeByte(4);
        break;
      case TypeEnum.workout:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
