import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../data/models/all_products.dart';
import '../../../data/repository/box_repository.dart';


class CreateProductScreenController extends GetxController {
  final Box _observableBox = AllProductsBoxRepository.getBox();

  Box get observableBox => _observableBox;

  int get productsCount=>observableBox.length;


  createProduct({required AllProducts allProducts}){
    _observableBox.add(allProducts);
    update();
}

  updateProduct({required AllProducts allProducts}){
    _observableBox.putAt(int.parse(allProducts.id!), allProducts);
update();
}

  deleteOneProduct({required int index}){
    _observableBox.deleteAt(index);
update();
}

  deleteAllProducts(){
    _observableBox.deleteAll(observableBox.keys);
    update();
  }



  @override
  void onInit() {
    observableBox;
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
