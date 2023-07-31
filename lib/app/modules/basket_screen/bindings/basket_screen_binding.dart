import 'package:get/get.dart';
import '../controllers/basket_screen_controller.dart';


class BasketScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasketScreenController>(
          () => BasketScreenController(),
    );
  }
}
