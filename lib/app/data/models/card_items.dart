import 'package:hive_flutter/adapters.dart';
part 'card_items.g.dart';

@HiveType(typeId:1)
class CardItems extends HiveObject{
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? productBrand;
  @HiveField(2)
  final String? productModel;
  @HiveField(3)
  final int? productDiagonal;
  @HiveField(4)
  final String? productResolution;
  @HiveField(5)
  final double? productPrice;
  @HiveField(6)
  final String? productImage;
  @HiveField(7)
  final String? productFullName;
  @HiveField(8)
  final int? productAmount;
  @HiveField(9)
  final String? productId;
  @HiveField(10)
  final String? productLongDescription;




  CardItems({
    required this.id,
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

