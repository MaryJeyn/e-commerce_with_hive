import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/data/models/all_products.dart';
import 'app/data/models/card_items.dart';
import 'app/data/models/ordered_products.dart';
import 'app/routes/app_pages.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AllProductsAdapter());
  await Hive.openBox<AllProducts>("all_products");

  Hive.registerAdapter(CardItemsAdapter());
  await Hive.openBox<CardItems>("card_items");

  Hive.registerAdapter(OrderedProductsAdapter());
  await Hive.openBox<OrderedProducts>("orders_products");




  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.BOTTOM_NAVIGATION_SCREEN,
      getPages: AppPages.routes,
    ),
  );
}