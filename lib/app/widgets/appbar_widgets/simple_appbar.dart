import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/app_configurations/app_color.dart';
import '../text_widgets/app_bar_title.dart';

class SimpleAppBar extends StatelessWidget {
  final String? title;

  const SimpleAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color:AppColor.mainColor, size: 25
      ),
      automaticallyImplyLeading: false,
      // leading:IconButton(onPressed: (){
      //   Get.back();
      // }, icon: Icon(Icons.arrow_back_outlined)),
      flexibleSpace: Container(
        color: AppColor.whiteColor,
      ),
      centerTitle: true,
      title: AppBarTitle(text: title!,),
    );
  }
}

