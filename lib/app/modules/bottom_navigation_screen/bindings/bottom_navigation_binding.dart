import 'package:get/get.dart';
import '../../orders_screen/controllers/orders_screen_controller.dart';
import '../../basket_screen/controllers/basket_screen_controller.dart';
import '../../create_product_screen/controllers/create_product_screen_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController(),);
    Get.lazyPut<HomeController>(() => HomeController(),);
    Get.lazyPut<BasketScreenController>(() => BasketScreenController(),);
    Get.lazyPut<CreateProductScreenController>(() => CreateProductScreenController(),);
    Get.lazyPut<OrderScreenController>(() => OrderScreenController(),);
  }
}
