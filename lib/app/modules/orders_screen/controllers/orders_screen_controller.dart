import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../data/repository/box_repository.dart';

class OrderScreenController extends GetxController {
  //order item
  final Box _ordersBox = OrderedProductsBoxRepository.getBox();
  Box get ordersBox => _ordersBox;
  int get ordersItemsCount=>ordersBox.length;



  deleteOrder({required int index}){
    _ordersBox.deleteAt(index);
    update();
  }

  deleteAllOrder(){
    _ordersBox.deleteAll(ordersBox.keys);
    update();
  }





  @override
  void onInit() {
    ordersBox;
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
