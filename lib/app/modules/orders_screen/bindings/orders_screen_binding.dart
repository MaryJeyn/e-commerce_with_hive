import 'package:get/get.dart';
import '../controllers/orders_screen_controller.dart';

class OrderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderScreenController>(
          () => OrderScreenController(),
    );
  }
}
