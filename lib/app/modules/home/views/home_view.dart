import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../core/app_configurations/app_color.dart';
import '../../../data/models/all_products.dart';
import '../../../widgets/products_design.dart';
import '../../../widgets/text_widgets/app_bar_title.dart';
import '../../../widgets/text_widgets/normal_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.075),
          child: AppBar(
            iconTheme: IconThemeData(color: AppColor.mainColor, size: 25),
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              color: AppColor.whiteColor,
            ),
            centerTitle: true,
            title: AppBarTitle(
              text: "Best of all",
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_alt),
              ),
            ],
          ),
        ),
        body: buildColumn(context),
      ),
    );
  }

  buildColumn(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: NormalText(
              text: "All products",
              weight: FontWeight.bold,
              size: 16,
              color: AppColor.blackColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              height: MediaQuery.of(context).size.height-185,
              child: GetBuilder<HomeController>(
                builder: (control) => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: controller.itemsCount,
                  crossAxisSpacing: 16,
                  //productBox
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    if (controller.itemsCount > 0) {
                      AllProducts? prod = controller.productBox.getAt(index);
                      return ProductsDesignWidget(
                        model: prod,
                        context: context,
                      );
                    } else {
                      return Center(
                        child: Text("No products for now"),
                      );
                    }
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ),
          ),
        ],
      );
  }


}
