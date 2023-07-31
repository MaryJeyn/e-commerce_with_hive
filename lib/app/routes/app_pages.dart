import 'package:get/get.dart';
import '../modules/basket_screen/bindings/basket_screen_binding.dart';
import '../modules/basket_screen/views/basket_screen_view.dart';
import '../modules/bottom_navigation_screen/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_navigation_screen/views/bottom_navigation_view.dart';
import '../modules/create_product_screen/bindings/create_product_screen_binding.dart';
import '../modules/create_product_screen/views/create_product_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/orders_screen/bindings/orders_screen_binding.dart';
import '../modules/orders_screen/views/orders_screen_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BASKET_SCREEN,
      page: () => BasketScreenView(),
      binding: BasketScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION_SCREEN,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUCT_SCREEN,
      page: () => CreateProductScreenView(),
      binding: CreateProductScreenBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS_SCREEN,
      page: () => OrderScreenView(),
      binding: OrderScreenBinding(),
    ),


  ];
}
