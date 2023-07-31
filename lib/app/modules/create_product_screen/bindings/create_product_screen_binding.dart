import 'package:get/get.dart';
import '../controllers/create_product_screen_controller.dart';

class CreateProductScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProductScreenController>(
          () => CreateProductScreenController(),
    );
  }
}
