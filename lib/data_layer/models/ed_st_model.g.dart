// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ed_st_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EdStModelAdapter extends TypeAdapter<EdStModel> {
  @override
  final int typeId = 0;

  @override
  EdStModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EdStModel(
      title: fields[0] as String,
      subtitle: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EdStModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EdStModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
