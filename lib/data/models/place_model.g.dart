// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceModelAdapter extends TypeAdapter<PlaceModel> {
  @override
  final int typeId = 0;

  @override
  PlaceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceModel()
      ..id = fields[0] as String
      ..title = fields[1] as String
      ..address = fields[2] as String
      ..description = fields[3] as String
      ..openingTime = fields[4] as String
      ..facebookLink = fields[5] as String
      ..instagramLink = fields[6] as String
      ..thumbnail = fields[7] as String
      ..categoryId = fields[8] as String
      ..govermentId = fields[9] as String
      ..phone = fields[10] as int
      ..whatsupNumber = fields[11] as int
      ..images = fields[12] as List<String>;
  }

  @override
  void write(BinaryWriter writer, PlaceModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.openingTime)
      ..writeByte(5)
      ..write(obj.facebookLink)
      ..writeByte(6)
      ..write(obj.instagramLink)
      ..writeByte(7)
      ..write(obj.thumbnail)
      ..writeByte(8)
      ..write(obj.categoryId)
      ..writeByte(9)
      ..write(obj.govermentId)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.whatsupNumber)
      ..writeByte(12)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
