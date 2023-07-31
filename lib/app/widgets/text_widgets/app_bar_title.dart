import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/app_configurations/app_color.dart';

class AppBarTitle extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? weight;
  final String? font;
  final Color? color;
  final double? spacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const AppBarTitle({super.key, this.text, this.size, this.weight, this.font, this.color, this.spacing, this.maxLines, this.overflow, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text!, style: TextStyle(fontFamily: font??"Poppins",
        fontWeight:weight ?? FontWeight.bold,
        fontSize: size ?? 20,
        color:color ?? AppColor.mainColor,
        wordSpacing: spacing ?? 2,),maxLines: maxLines ?? 1, overflow: overflow??TextOverflow.ellipsis,textAlign:textAlign ?? TextAlign.justify,)
    );
  }
}
