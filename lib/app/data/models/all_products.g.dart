// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllProductsAdapter extends TypeAdapter<AllProducts> {
  @override
  final int typeId = 0;

  @override
  AllProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllProducts(
      id: fields[0] as String?,
      productBrand: fields[1] as String?,
      productModel: fields[2] as String?,
      productDiagonal: fields[3] as int?,
      productResolution: fields[4] as String?,
      productPrice: fields[5] as double?,
      productImage: fields[6] as String?,
      productFullName: fields[7] as String?,
      productLongDescription: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AllProducts obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productBrand)
      ..writeByte(2)
      ..write(obj.productModel)
      ..writeByte(3)
      ..write(obj.productDiagonal)
      ..writeByte(4)
      ..write(obj.productResolution)
      ..writeByte(5)
      ..write(obj.productPrice)
      ..writeByte(6)
      ..write(obj.productImage)
      ..writeByte(7)
      ..write(obj.productFullName)
      ..writeByte(8)
      ..write(obj.productLongDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
