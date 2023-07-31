import 'package:hive_flutter/adapters.dart';
part 'ordered_products.g.dart';

@HiveType(typeId:2)
class OrderedProducts extends HiveObject{
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? customerAdreess;
  @HiveField(2)
  final String? customerPhone;
  @HiveField(3)
  final String? customerName;
  @HiveField(4)
  final String? productBrand;
  @HiveField(5)
  final String? productModel;
  @HiveField(6)
  final int? productDiagonal;
  @HiveField(7)
  final String? productResolution;
  @HiveField(8)
  final double? productPrice;
  @HiveField(9)
  final String? productImage;
  @HiveField(10)
  final String? productFullName;
  @HiveField(11)
  final int? productAmount;
  @HiveField(12)
  final String? productId;
  @HiveField(13)
  final String? productLongDescription;



  OrderedProducts({
    required this.id,
    required this.customerAdreess,
    required this.customerPhone,
    required this.customerName,
    required this.productBrand,
    required this.productModel,
    required this.productDiagonal,
    required this.productResolution,
    required this.productPrice,
    required this.productImage,
    required this.productFullName,
    required this.productAmount,
    required this.productId,
    required this.productLongDescription,
  });





}



