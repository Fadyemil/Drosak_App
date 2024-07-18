// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 2;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      nameStudent: fields[0] as String,
      eductionalLevel: fields[1] as String,
      selectGrouP: fields[2] as String,
      day: fields[3] as String,
      TimePicker: fields[4] as String,
      numberPhoneStudent: fields[5] as String,
      dateRegistration: fields[6] as String,
      subtitle: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nameStudent)
      ..writeByte(1)
      ..write(obj.eductionalLevel)
      ..writeByte(2)
      ..write(obj.selectGrouP)
      ..writeByte(3)
      ..write(obj.day)
      ..writeByte(4)
      ..write(obj.TimePicker)
      ..writeByte(5)
      ..write(obj.numberPhoneStudent)
      ..writeByte(6)
      ..write(obj.dateRegistration)
      ..writeByte(7)
      ..write(obj.subtitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
