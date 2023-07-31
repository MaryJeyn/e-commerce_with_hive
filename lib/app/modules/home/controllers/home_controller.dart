import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../data/repository/box_repository.dart';

class HomeController extends GetxController {
  final Box _productBox = AllProductsBoxRepository.getBox();

  Box get productBox => _productBox;

  int get itemsCount=>productBox.length;



  @override
  void onInit() {
    productBox;
    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
