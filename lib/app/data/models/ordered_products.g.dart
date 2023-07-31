// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordered_products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderedProductsAdapter extends TypeAdapter<OrderedProducts> {
  @override
  final int typeId = 2;

  @override
  OrderedProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderedProducts(
      id: fields[0] as String?,
      customerAdreess: fields[1] as String?,
      customerPhone: fields[2] as String?,
      customerName: fields[3] as String?,
      productBrand: fields[4] as String?,
      productModel: fields[5] as String?,
      productDiagonal: fields[6] as int?,
      productResolution: fields[7] as String?,
      productPrice: fields[8] as double?,
      productImage: fields[9] as String?,
      productFullName: fields[10] as String?,
      productAmount: fields[11] as int?,
      productId: fields[12] as String?,
      productLongDescription: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderedProducts obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerAdreess)
      ..writeByte(2)
      ..write(obj.customerPhone)
      ..writeByte(3)
      ..write(obj.customerName)
      ..writeByte(4)
      ..write(obj.productBrand)
      ..writeByte(5)
      ..write(obj.productModel)
      ..writeByte(6)
      ..write(obj.productDiagonal)
      ..writeByte(7)
      ..write(obj.productResolution)
      ..writeByte(8)
      ..write(obj.productPrice)
      ..writeByte(9)
      ..write(obj.productImage)
      ..writeByte(10)
      ..write(obj.productFullName)
      ..writeByte(11)
      ..write(obj.productAmount)
      ..writeByte(12)
      ..write(obj.productId)
      ..writeByte(13)
      ..write(obj.productLongDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderedProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
