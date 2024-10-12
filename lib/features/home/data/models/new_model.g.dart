// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewModelAdapter extends TypeAdapter<NewModel> {
  @override
  final int typeId = 0;

  @override
  NewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewModel(
      title: fields[0] as String?,
      description: fields[1] as String?,
      content: fields[2] as String?,
      url: fields[3] as String?,
      urlToImage: fields[4] as String?,
      publishedAt: fields[5] as String?,
      sourceModel: fields[6] as SourceModel,
      bookMark: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NewModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.urlToImage)
      ..writeByte(5)
      ..write(obj.publishedAt)
      ..writeByte(6)
      ..write(obj.sourceModel)
      ..writeByte(7)
      ..write(obj.bookMark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
