// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 1;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      title: fields[0] as String?,
      authors: (fields[1] as List?)?.cast<dynamic>(),
      publisher: fields[2] as String?,
      publishedDate: fields[3] as String?,
      description: fields[4] as String?,
      pageCount: fields[5] as int?,
      categories: (fields[6] as List?)?.cast<dynamic>(),
      imageLinks: (fields[7] as Map?)?.cast<dynamic, dynamic>(),
      userComments: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.pageCount)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.imageLinks)
      ..writeByte(8)
      ..write(obj.userComments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
