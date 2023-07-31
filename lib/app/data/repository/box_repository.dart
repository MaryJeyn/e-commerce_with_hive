import 'package:hive/hive.dart';
import '../models/all_products.dart';
import '../models/card_items.dart';
import '../models/ordered_products.dart';

class AllProductsBoxRepository{
  static const String boxName="all_products";

  static openBox()async =>await Hive.openBox<AllProducts>(boxName);

  static Box getBox()=>Hive.box<AllProducts>(boxName);

  static closeBox() async => await Hive.box(boxName).close();

  static clearBox() async => await Hive.box(boxName).clear();
}


class OrderedProductsBoxRepository{
  static const String boxName="orders_products";

  static openBox()async =>await Hive.openBox<OrderedProducts>(boxName);

  static Box getBox()=>Hive.box<OrderedProducts>(boxName);

  static closeBox() async => await Hive.box(boxName).close();

  static clearBox() async => await Hive.box(boxName).clear();
}


class CardItemsBoxRepository{
  static const String boxName="card_items";

  static openBox()async =>await Hive.openBox<CardItems>(boxName);

  static Box getBox()=>Hive.box<CardItems>(boxName);

  static closeBox() async => await Hive.box(boxName).close();

  static clearBox() async => await Hive.box(boxName).clear();
}

