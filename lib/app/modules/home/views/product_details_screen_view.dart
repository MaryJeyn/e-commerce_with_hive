import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import '../../../core/app_configurations/app_color.dart';
import '../../../data/models/all_products.dart';
import '../../../data/models/card_items.dart';
import '../../../widgets/appbar_widgets/simple_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_widgets/item_title.dart';
import '../../../widgets/text_widgets/normal_text.dart';
import '../../basket_screen/controllers/basket_screen_controller.dart';
import '../controllers/home_controller.dart';


class ProductDetailScreenView extends GetView<HomeController> {
  final AllProducts? model;
  HomeController controller = Get.put(HomeController());
  BasketScreenController basketController = Get.put(BasketScreenController());
  TextEditingController counterController=TextEditingController();

  ProductDetailScreenView(this.model);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.07),
            child: SimpleAppBar(title: "Product Details")
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemTitle(text: model!.productBrand!+" "+model!.productModel!+" "+model!.productDiagonal.toString()+" "+model!.productResolution!.toString()),
                      //image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => const SizedBox(),
                          fit: BoxFit.fill,
                          imageUrl: model!.productImage!,
                          height: MediaQuery.of(context).size.height*0.35,
                          width: MediaQuery.of(context).size.width-15,
                        ),
                      ),

                      ItemTitle(text: model!.productBrand!, color: AppColor.blueColor,),

                      NormalText(text: "Television model: "+model!.productModel!,size: 16,),

                      NormalText(text: "Diagonal: "+model!.productDiagonal.toString()+" inc",size: 16,color: AppColor.boldGreyColor),

                      NormalText(text: "Resolution: "+model!.productResolution!,size: 16,color: AppColor.boldGreyColor),

                      NormalText(text: model!.productLongDescription!, maxLines: 3,size: 16,color: AppColor.greyColor),

                      ItemTitle(text: model!.productPrice!.toString()+" manat", color: AppColor.redColor,size: 19),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: NumberInputPrefabbed.roundedEdgeButtons(controller: counterController, decIconSize: 40,incIconSize: 40,
                          incDecBgColor: Colors.amber,
                          min: 1,
                          max: 100,
                          initialValue: 1,
                          buttonArrangement:ButtonArrangement.incRightDecLeft,
                        ),
                      ),

                      Center(
                        child: CustomButtonWidget(onClick: () async {
                          createCardItem(context);
                          },text: "Add", ),
                      ),


                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

   createCardItem(BuildContext context) {
    Random random=Random();
    basketController.createCardItem(cardItems: CardItems(
      id: '${random.nextInt(10000000)}',
      productAmount: int.parse(counterController.text),
      productResolution: model!.productResolution!,
      productPrice: model!.productPrice!,
      productModel: model!.productModel!,
      productImage: model!.productImage!,
      productFullName: model!.productFullName!,
      productDiagonal: model!.productDiagonal!,
      productBrand: model!.productBrand!,
      productId: model!.id!,
      productLongDescription:  model!.productLongDescription,
    ));

    Get.snackbar(
      "Product Added",
      "You have added the product to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );

    Navigator.pop(context);
  }
}
