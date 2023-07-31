import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_configurations/app_color.dart';
import '../../basket_screen/views/basket_screen_view.dart';
import '../../create_product_screen/views/create_product_screen_view.dart';
import '../../home/views/home_view.dart';
import '../../orders_screen/views/orders_screen_view.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {

  final screens = [
    HomeView(),
    BasketScreenView(),
    CreateProductScreenView(),
    OrderScreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          child: Center(
            child: IndexedStack(index: controller.tabIndex, children: screens),
          ),
        ),
      );
    });
  }

  Widget get bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: controller.tabIndex,
      onTap: controller.changeTabIndex,
      items: [
        _bottomNavigationBarItem(Icons.grid_view_outlined, "Products"),
        _bottomNavigationBarItem(Icons.shopping_cart, "Basket"),
        _bottomNavigationBarItem(Icons.add_circle, "Create product"),
        _bottomNavigationBarItem(Icons.delivery_dining_outlined, "Orders")
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.whiteColor,
      selectedItemColor: AppColor.mainColor,
      unselectedItemColor: AppColor.greyColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  _bottomNavigationBarItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: 28,
      ),
      label: label,
    );
  }
}
