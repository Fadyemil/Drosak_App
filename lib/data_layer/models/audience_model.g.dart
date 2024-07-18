// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audience_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudienceModelAdapter extends TypeAdapter<AudienceModel> {
  @override
  final int typeId = 3;

  @override
  AudienceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudienceModel(
      InputName: fields[0] as String?,
      ExpenseName: fields[1] as String?,
      subtitle: fields[2] as String?,
      totalMoney: fields[3] as int?,
      IncreasesMoney: fields[4] as int?,
      decreasesMoney: fields[5] as int?,
      sharePrice: fields[6] as int?,
      numberStudent: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AudienceModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.InputName)
      ..writeByte(1)
      ..write(obj.ExpenseName)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.totalMoney)
      ..writeByte(4)
      ..write(obj.IncreasesMoney)
      ..writeByte(5)
      ..write(obj.decreasesMoney)
      ..writeByte(6)
      ..write(obj.sharePrice)
      ..writeByte(7)
      ..write(obj.numberStudent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudienceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
