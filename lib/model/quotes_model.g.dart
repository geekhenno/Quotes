// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuotesModelAdapter extends TypeAdapter<QuotesModel> {
  @override
  final int typeId = 0;

  @override
  QuotesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuotesModel(
      id: fields[0] as int,
      author: fields[1] as String,
      quote: fields[2] as String,
      permalink: fields[3] as String,
      isLiked: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QuotesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.quote)
      ..writeByte(3)
      ..write(obj.permalink)
      ..writeByte(4)
      ..write(obj.isLiked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuotesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
