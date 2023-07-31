import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../core/app_configurations/app_color.dart';
import '../data/models/all_products.dart';
import '../modules/home/views/product_details_screen_view.dart';
import 'text_widgets/normal_text.dart';


class ProductsDesignWidget extends StatelessWidget {
  final AllProducts? model;
  final BuildContext? context;

  const ProductsDesignWidget({super.key, this.model, this.context});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=>ProductDetailScreenView(model)),
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const SizedBox(),
                    fit: BoxFit.fill,
                    imageUrl: model!.productImage!,
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.5,
                  ),
                ),
                NormalText(text: model!.productBrand!+" "+model!.productModel!+" "+model!.productDiagonal.toString()+" "+model!.productResolution!.toString(),weight: FontWeight.bold,maxLines: 2,textAlign: TextAlign.start,),
                NormalText(text: model!.productModel),
                NormalText(text: model!.productPrice.toString()+" manat",color: AppColor.redColor,size: 16, weight: FontWeight.bold,),

              ],
            ),
          ),
        )
    );
  }
}
