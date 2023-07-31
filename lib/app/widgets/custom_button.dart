import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/app_configurations/app_color.dart';
import '../core/utils/constant_width_gaps.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? text;
  final double? textSize;
  final FontWeight? textWeight;
  final String? textFont;
  final Color? textColor;
  final double? textSpacing;
  final GestureTapCallback? onClick;
  final int? textMaxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? buttonRadius;
  final Color? buttonBorderColor;
  final IconData? buttonIcon;
  final Color? iconColor;
  final double? icontSize;

  const CustomButtonWidget({super.key, this.text, this.textSize, this.textWeight, this.textFont, this.textColor, this.textSpacing, this.onClick, this.textMaxLines, this.textOverflow, this.textAlign, this.buttonColor, this.buttonWidth, this.buttonHeight, this.buttonRadius, this.buttonBorderColor, this.buttonIcon, this.iconColor, this.icontSize});


  @override
  Widget build(BuildContext context) {
    return
      InkWell(
          onTap: ()=>onClick!.call(),//onTap:()=>onClick!.call,
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: buttonHeight ?? 70.0,
            width: buttonWidth ?? MediaQuery.of(context).size.width-100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(buttonRadius ?? 20),
              border: Border.all(color: buttonBorderColor ?? AppColor.mainColor),
              color: buttonColor ?? AppColor.mainColor,
            ),
            child: Center(
              child: buttonIcon!=null?Row(
                children: [
                  Icon(buttonIcon!, size: icontSize ?? 25, color: iconColor ?? AppColor.whiteColor,),
                  gapW6,
                  Text(text!, style: TextStyle(fontFamily: textFont??"Poppins",
                    fontWeight:textWeight ?? FontWeight.bold,
                    fontSize: textSize ?? 18,
                    color:textColor ?? AppColor.whiteColor,
                    wordSpacing: textSpacing ?? 1,), maxLines: textMaxLines ?? 2, overflow: textOverflow??TextOverflow.ellipsis,textAlign:textAlign ?? TextAlign.justify),
                ],
              ):Text(text!, style: TextStyle(fontFamily: textFont??"Poppins",
                fontWeight:textWeight ?? FontWeight.bold,
                fontSize: textSize ?? 18,
                color:textColor ?? AppColor.whiteColor,
                wordSpacing: textSpacing ?? 1,), maxLines: textMaxLines ?? 2, overflow: textOverflow??TextOverflow.ellipsis,textAlign:textAlign ?? TextAlign.justify),
            ),
          ));
  }
}
