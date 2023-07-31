import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_configurations/app_color.dart';
import '../../../core/utils/constant_width_gaps.dart';
import '../../../data/models/card_items.dart';
import '../../../data/models/ordered_products.dart';
import '../../../widgets/appbar_widgets/simple_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/form_field_widgets/normal_text_form_field.dart';
import '../../../widgets/form_field_widgets/telefone_number_form_field.dart';
import '../../../widgets/text_widgets/item_title.dart';
import '../../../widgets/text_widgets/normal_text.dart';
import '../controllers/basket_screen_controller.dart';


class BasketScreenView extends GetView<BasketScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.07),
            child: SimpleAppBar(title: "Cart items")),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            heroTag: "btn3",
            label: Text("Create Order"),
            backgroundColor: AppColor.blueColor,
            onPressed: () => _showModalBottomSheet(context: context,),
          ),
        ),
        body: basketBody(),
      ),
    );


  }

  GetBuilder<BasketScreenController> basketBody() {
    return GetBuilder<BasketScreenController>(
        builder: (control) => ListView.builder(
            itemCount: controller.cardItemsCount,
            itemBuilder: (context, index) {
                CardItems? cardProd = control.cardBox.getAt(index);
  if (control.cardItemsCount > 0) {
                return ListTile(
                  contentPadding: EdgeInsets.all(5),
                  leading:ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const SizedBox(),
                      fit: BoxFit.fill,
                      imageUrl: cardProd!.productImage!,
                      width: MediaQuery.of(context).size.width/6,
                    ),
                  ),
                  title: NormalText(text: cardProd!.productFullName!,maxLines: 2,),
                  subtitle: Row(
                    children: [
                      NormalText(
                        text: cardProd!.productPrice!.toString()+" manat",
                        color: AppColor.redColor,weight: FontWeight.bold,
                      ),
                      NormalText(
                        text: "X "+cardProd!.productAmount!.toString(),
                        color: AppColor.blueColor,weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () => control.deleteCardItem(index: index),
                      icon: Icon(Icons.delete),
                      color: AppColor.boldGreyColor),
                );}else{
    return Center(
      child: ItemTitle(text: "Cart is empty"),
    );
  }
            }),
      );
  }


  _showModalBottomSheet({required BuildContext context}) {
    Random random = Random();
    TextEditingController customerAdreessController = TextEditingController();
    TextEditingController customerPhoneController = TextEditingController();
    TextEditingController customerNameController = TextEditingController();
    showModalBottomSheet(
      isDismissible: true,
      elevation: 4,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NormalTextFormField(
                controller: customerAdreessController,
                hintText: "Enter your address here",
              ),
              TelefoneNumberTextFormField(
                controller: customerPhoneController,
                hintText: "63626150",
              ),
              NormalTextFormField(
                controller: customerNameController,
                hintText: "Enter your name here",
              ),
              gapW4,
              CustomButtonWidget(
                text: "Save",
                onClick: () async{
                  createNewOrder(random, customerAdreessController, customerNameController, customerPhoneController, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createNewOrder(Random random, TextEditingController customerAdreessController, TextEditingController customerNameController, TextEditingController customerPhoneController, BuildContext context) {
    controller.createOrder(
      orderedProducts: OrderedProducts(
        id: '${random.nextInt(10000000)}',
        customerAdreess: customerAdreessController.text,
        customerName: customerNameController.text,
        customerPhone: customerPhoneController.text,
        productBrand: controller.cardBox.getAt(controller.cardItemsCount-1).productBrand,
        productDiagonal: controller.cardBox.getAt(controller.cardItemsCount-1).productDiagonal,
        productFullName: controller.cardBox.getAt(controller.cardItemsCount-1).productFullName,
        productImage: controller.cardBox.getAt(controller.cardItemsCount-1).productImage,
        productModel: controller.cardBox.getAt(controller.cardItemsCount-1).productModel,
        productResolution: controller.cardBox.getAt(controller.cardItemsCount-1).productResolution,
        productId: controller.cardBox.getAt(controller.cardItemsCount-1).productId,
        productAmount: controller.cardBox.getAt(controller.cardItemsCount-1).productAmount,
        productPrice: controller.cardBox.getAt(controller.cardItemsCount-1).productPrice,
        productLongDescription: controller.cardBox.getAt(controller.cardItemsCount-1).productLongDescription,),);
      Navigator.pop(context);
  }
}
