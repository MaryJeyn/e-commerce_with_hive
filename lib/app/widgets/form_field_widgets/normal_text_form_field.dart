import 'package:flutter/material.dart';

import '../../core/app_configurations/app_color.dart';


class NormalTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? iconData;
  final Color? iconDataColor;
  final String? hintText;
  final Color? hintTextColor;
  final Color? borderSideColor;
  final double? borderRadius;
  final String? errorText;
  final Color? errorTextColor;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final bool? isObsecre;
  final bool? enabled;

  NormalTextFormField({Key? key, required this.controller, this.iconData,this.iconDataColor ,this.enabled, this.hintTextColor, this.errorTextColor, this.isObsecre, this.hintText, this.borderSideColor, this.borderRadius, this.errorText, this.textAlign, this.textInputType});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled ?? true,
        obscureText: isObsecre ?? false,
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        style: const TextStyle(color: AppColor.blackColor, fontSize: 16),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 60,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, right: 10, left: 5),
                    child: Icon(iconData, color: iconDataColor ?? AppColor.greyColor, size: 25,),
                  ))),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
          hintStyle: TextStyle(color: hintTextColor ?? AppColor.greyColor),
          errorText: errorText,
          errorStyle: TextStyle(color: errorTextColor ?? AppColor.redColor),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderSideColor ?? AppColor.greyColor, width: 2),
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderSideColor ?? AppColor.greyColor, width: 2),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),),
      ),
    );
  }
}
