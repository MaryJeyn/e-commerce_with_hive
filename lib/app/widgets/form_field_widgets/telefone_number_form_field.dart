import 'package:flutter/material.dart';

import '../../core/app_configurations/app_color.dart';


class TelefoneNumberTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? iconData;
  final Color? iconDataColor;
  final String? hintText;
  final String? countryNumber;
  final Color? hintTextColor;
  final Color? borderSideColor;
  final double? borderRadius;
  final String? errorText;
  final Color? errorTextColor;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final bool? isObsecre;
  final bool? enabled;

  const TelefoneNumberTextFormField({super.key, required this.controller, this.iconData, this.iconDataColor, this.hintText, this.countryNumber, this.hintTextColor, this.borderSideColor, this.borderRadius, this.errorText, this.errorTextColor, this.textAlign, this.textInputType, this.isObsecre, this.enabled});




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled ?? true,
        obscureText: isObsecre ?? false,
        controller: controller,
        keyboardType: textInputType ?? TextInputType.number,
        style: const TextStyle(color: AppColor.blackColor, fontSize: 16),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 60,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(countryNumber??
                  '+993 ',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.greyColor,
                  ),
                ),
              ),
            ),),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText??"Phone",
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



