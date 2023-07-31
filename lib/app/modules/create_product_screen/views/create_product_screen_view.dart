import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_configurations/app_color.dart';
import '../../../core/utils/constant_width_gaps.dart';
import '../../../data/models/all_products.dart';
import '../../../widgets/appbar_widgets/simple_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/form_field_widgets/normal_text_form_field.dart';
import '../../../widgets/text_widgets/normal_text.dart';
import '../controllers/create_product_screen_controller.dart';

class CreateProductScreenView extends GetView<CreateProductScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.07),
            child: SimpleAppBar(title: "Add new product")),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            gapW10,
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: "btn1",
                label: Text("Delete all products"),
                backgroundColor: AppColor.blueColor,
                onPressed: () =>controller.deleteAllProducts(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: "btn2",
                label: Text("Add new Product"),
                backgroundColor: AppColor.blueColor,
                onPressed: () => _showModalBottomSheet(context: context,),
              ),
            ),
          ],
        ),
        body:
        GetBuilder<CreateProductScreenController>(
          builder: (control) => ListView.builder(
              itemCount: controller.productsCount,
              itemBuilder: (context, index) {
                if (control.productsCount > 0) {
                  AllProducts? prod = control.observableBox.getAt(index);
                  return ListTile(
                    contentPadding: EdgeInsets.all(5),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => const SizedBox(),
                        fit: BoxFit.fill,
                        imageUrl: prod!.productImage!,
                        width: MediaQuery.of(context).size.width/6,
                      ),
                    ),
                    title: NormalText(text: prod!.productFullName!,maxLines: 2,),
                    subtitle: NormalText(
                      text: prod!.productPrice!.toString()+" manat",
                      color: AppColor.redColor,weight: FontWeight.bold,
                    ),
                    trailing: IconButton(
                        onPressed: () =>
                            control.deleteOneProduct(index: index),
                        icon: Icon(Icons.delete),
                        color: AppColor.boldGreyColor),

                  );
                } else {
                  return Center(
                    child: Text("No products for now"),
                  );
                }
              }),
        ),
      ),
    );
  }

  _showModalBottomSheet({required BuildContext context}) {
    Random random = Random();
    TextEditingController imageUrlController = TextEditingController();
    TextEditingController brandController = TextEditingController();
    TextEditingController modelController = TextEditingController();
    TextEditingController diagonalController = TextEditingController();
    TextEditingController resolutionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController productDescriptionController = TextEditingController();
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
                controller: imageUrlController,
                hintText: "Enter products image url here",
              ),
              NormalTextFormField(
                controller: brandController,
                hintText: "Enter products producer here",
              ),
              NormalTextFormField(
                controller: modelController,
                hintText: "Enter products model here",
              ),
              NormalTextFormField(
                controller: diagonalController,
                textInputType: TextInputType.number,
                hintText: "Enter products diagonal here",
              ),
              NormalTextFormField(
                controller: resolutionController,
                textInputType: TextInputType.text,
                hintText: "Enter products resolution here",
              ),
              NormalTextFormField(
                controller: priceController,
                textInputType: TextInputType.number,
                hintText: "Enter products price here",
              ),
              NormalTextFormField(
                controller: productDescriptionController,
                hintText: "Enter products description here",
              ),
              gapW4,
              CustomButtonWidget(
                text: "Save",
                onClick: () async {
                  await controller.createProduct(
                      allProducts: AllProducts(
                          id: '${random.nextInt(10000)}',
                          productBrand: brandController.text,
                          productDiagonal: int.parse(diagonalController.text),
                          productFullName: "Television " + brandController.text + "" + modelController.text + "" + diagonalController.text.toString() + "" + resolutionController.text,
                          productImage: imageUrlController.text,
                          productModel: modelController.text,
                          productPrice: double.parse(priceController.text),
                          productResolution: resolutionController.text,
                          productLongDescription: productDescriptionController.text));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
