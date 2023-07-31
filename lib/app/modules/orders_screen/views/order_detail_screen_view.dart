import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_configurations/app_color.dart';
import '../../../core/utils/constant_height_gaps.dart';
import '../../../core/utils/constant_width_gaps.dart';
import '../../../data/models/ordered_products.dart';
import '../../../widgets/appbar_widgets/simple_appbar.dart';
import '../../../widgets/text_widgets/item_title.dart';
import '../../../widgets/text_widgets/normal_text.dart';
import '../../basket_screen/controllers/basket_screen_controller.dart';
import '../controllers/orders_screen_controller.dart';


class OrderDetailScreenView extends GetView<OrderScreenController> {
  final OrderedProducts? model;

  BasketScreenController basketController = Get.put(BasketScreenController());

  OrderDetailScreenView(this.model);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.07),
            child: SimpleAppBar(title: "Order Details")
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            gapW10,
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: "btn3",
                label: Text("Delete Order"),
                backgroundColor: AppColor.blueColor,
                onPressed: () async {
                  deleteOrder(context);
                }
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: "btn4",
                label: Text("Confirm Order"),
                backgroundColor: AppColor.blueColor,
                onPressed: () async {
                  confirmOrder(context);

                }
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: buildScreen(context),
        ),
      ),
    );
  }

  void confirmOrder(BuildContext context) {
    basketController.deleteAllCardItem();

    Get.snackbar(
      "Order Confirmed",
      "Your order was confirmed",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );

    Navigator.pop(context);
  }

  void deleteOrder(BuildContext context) {
    controller.deleteOrder(index:controller.ordersItemsCount-1);
    basketController.deleteAllCardItem();

    Get.snackbar(
      "Order deleted",
      "Your order was deleted",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );

    Navigator.pop(context);
  }


  buildScreen(BuildContext context) {
    return Column(
        children: [
          Container(
            height: controller.ordersItemsCount*165,
            child: GetBuilder<OrderScreenController>(
              builder: (control) => ListView.builder(
                  itemCount: controller.ordersItemsCount,
                  itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const SizedBox(),
                                fit: BoxFit.fill,
                                imageUrl: model!.productImage!,
                                height: MediaQuery.of(context).size.height*0.2,
                                width: MediaQuery.of(context).size.width*0.3,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(text: model!.productFullName!,weight: FontWeight.bold,color: AppColor.mainColor),
                                NormalText(text: model!.productBrand!,color: AppColor.blueColor,weight: FontWeight.bold ),
                                NormalText(text: "Diagonal: "+model!.productDiagonal!.toString()+" "+"Resolution: "+model!.productResolution!, color: AppColor.boldGreyColor),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    NormalText(text: model!.productPrice!.toString()+" manat ", color: AppColor.redColor,weight: FontWeight.bold),
                                    NormalText(text: " X "+model!.productAmount!.toString(), color: AppColor.blueColor,weight: FontWeight.bold),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                  }),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.17,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(text: "Customers name => "+model!.customerName!,color: AppColor.boldGreyColor,weight: FontWeight.bold),
                NormalText(text: "Customers name => "+model!.customerPhone!,color: AppColor.boldGreyColor,weight: FontWeight.bold),
                NormalText(text: "Customers name => "+model!.customerAdreess!,color: AppColor.boldGreyColor,weight: FontWeight.bold),

                gapH6,

                Align(
                  alignment: Alignment.bottomRight,
                    child: ItemTitle(text: "Total Price: "+(controller.ordersBox.getAt(controller.ordersItemsCount-1).productPrice!*controller.ordersBox.getAt(controller.ordersItemsCount-1).productAmount!).toString(), color: AppColor.redColor,))
              ],
            ),
          ),
        ],
      );
  }
}
