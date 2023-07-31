import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constant_height_gaps.dart';
import '../../../core/utils/constant_width_gaps.dart';
import '../../../core/app_configurations/app_color.dart';
import '../../../widgets/appbar_widgets/simple_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_widgets/item_title.dart';
import '../../../widgets/text_widgets/normal_text.dart';
import '../controllers/orders_screen_controller.dart';
import 'order_detail_screen_view.dart';

class OrderScreenView extends GetView<OrderScreenController> {
  const OrderScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.07),
            child: SimpleAppBar(title: "Ordered items")),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
              heroTag: "btn4",
              label: Text("Delete All Orders"),
              backgroundColor: AppColor.blueColor,
              onPressed: () => controller.deleteAllOrder(),
          ),
        ),
        body: controller.ordersItemsCount==0?Center(
          child: ItemTitle(text: "No orders yet"),)
            : buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              height: controller.ordersItemsCount*80,
              child: GetBuilder<OrderScreenController>(
                builder: (control) => ListView.builder(
                    itemCount: controller.ordersItemsCount,
                    itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(5),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => const SizedBox(),
                              fit: BoxFit.fill,
                              imageUrl: control.ordersBox.getAt(controller.ordersItemsCount-1).productImage!,
                              width: MediaQuery.of(context).size.width/6,
                            ),
                          ),
                          title: NormalText(text: control.ordersBox.getAt(controller.ordersItemsCount-1).productFullName!,maxLines: 2,),
                          subtitle: NormalText(
                              text: control.ordersBox.getAt(controller.ordersItemsCount-1).productPrice!.toString(),
                              color: AppColor.redColor,weight: FontWeight.bold
                          ),
                          trailing: IconButton(
                              onPressed: () => control.deleteOrder(index: index),
                              icon: Icon(Icons.delete),
                              color: AppColor.boldGreyColor),
                        );
                    }),
              ),
            ),
            controller.ordersItemsCount==0?gapH4:Container(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonWidget(
                        onClick: ()async{
                          Get.to(()=>OrderDetailScreenView(controller.ordersBox.getAt(controller.ordersItemsCount-1)));

                        },
                        text: "Show Details...",
                        buttonHeight: 40,
                        buttonWidth: 160,
                        buttonColor: AppColor.blueColor,
                        buttonBorderColor: AppColor.blueColor,
                      ),

                      gapW20,

                      Expanded(child: ItemTitle(text: "Total Price: "+(controller.ordersBox.getAt(controller.ordersItemsCount-1).productPrice!*controller.ordersBox.getAt(controller.ordersItemsCount-1).productAmount!).toString(), color:AppColor.redColor)),
                    ],
                  ),
                ))
          ],
        ),
      );
  }
}
