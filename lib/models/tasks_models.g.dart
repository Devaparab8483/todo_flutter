// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class todoTaskModelAdapter extends TypeAdapter<todoTaskModel> {
  @override
  final int typeId = 0;

  @override
  todoTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return todoTaskModel(
      taskTitle: fields[0] as String,
      task: fields[1] as String,
      date: fields[2] as String,
      time: fields[3] as String,
      colorsCell: fields[4] as String,
      selectedIndex: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, todoTaskModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.taskTitle)
      ..writeByte(1)
      ..write(obj.task)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.colorsCell)
      ..writeByte(5)
      ..write(obj.selectedIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is todoTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
