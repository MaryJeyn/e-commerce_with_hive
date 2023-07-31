import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../data/models/card_items.dart';
import '../../../data/models/ordered_products.dart';
import '../../../data/repository/box_repository.dart';


class BasketScreenController extends GetxController {

  //card item
  final Box _cardBox = CardItemsBoxRepository.getBox();
  Box get cardBox => _cardBox;
  int get cardItemsCount=>cardBox.length;

  createCardItem({required CardItems cardItems}) async {
    _cardBox.add(cardItems);
    update();
  }

  updateCardItem({required CardItems cardItems}){
    _cardBox.putAt(int.parse(cardItems.id!), cardItems);
    update();
  }

  deleteCardItem({required int index}){
    _cardBox.deleteAt(index);
    update();
  }

  deleteAllCardItem(){
    _cardBox.deleteAll(cardBox.keys);
    update();
  }


  //order item
  final Box _orderBox = OrderedProductsBoxRepository.getBox();
  Box get orderBox => _orderBox;
  int get orderItemsCount=>orderBox.length;

  createOrder({required OrderedProducts orderedProducts}){
    _orderBox.add(orderedProducts);
    update();
  }



  @override
  void onInit() {
    cardBox;
    orderBox;
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
