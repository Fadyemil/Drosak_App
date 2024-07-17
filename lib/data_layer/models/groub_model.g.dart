// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groub_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroubModelAdapter extends TypeAdapter<GroubModel> {
  @override
  final int typeId = 1;

  @override
  GroubModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroubModel(
      nameGroub: fields[1] as String? ?? "",
      edLevel: fields[2] as String? ?? "",
      day: fields[3] as String? ?? "",
      timePacker: fields[4] as String? ?? "",
      numberStudent: fields[5] as String? ?? "",
      subtitle: fields[6] as String? ?? "",
    );
  }

  @override
  void write(BinaryWriter writer, GroubModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.nameGroub)
      ..writeByte(2)
      ..write(obj.edLevel)
      ..writeByte(3)
      ..write(obj.day)
      ..writeByte(4)
      ..write(obj.timePacker)
      ..writeByte(5)
      ..write(obj.numberStudent)
      ..writeByte(6)
      ..write(obj.subtitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroubModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
