import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int tabIndex=0;

  changeTabIndex(int index){
    tabIndex=index;
    update();
  }
}
