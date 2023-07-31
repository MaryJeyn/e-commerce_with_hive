import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/app_configurations/app_color.dart';

class ItemTitle extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? weight;
  final String? font;
  final Color? color;
  final double? spacing;
  final VoidCallback? onClick;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const ItemTitle({Key? key, required this.text, this.size, this.font, this.weight, this.color, this.spacing,this.maxLines,this.overflow,this.textAlign,this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: onClick==null?
      Text(text!, style: TextStyle(fontFamily: font??"Poppins",
        fontWeight:weight ?? FontWeight.bold,
        fontSize: size ?? 16,
        color:color ?? AppColor.mainColor,
        wordSpacing: spacing ?? 1,),maxLines: maxLines ?? 1, overflow: overflow??TextOverflow.ellipsis,textAlign:textAlign ?? TextAlign.justify,)
          :TextButton(onPressed: ()=>onClick!.call(), child:  Text(text!, style: TextStyle(fontFamily: font??"Poppins",
        fontWeight:weight ?? FontWeight.bold,
        fontSize: size ?? 16,
        color:color ?? AppColor.mainColor,
        wordSpacing: spacing ?? 1,), maxLines: maxLines ?? 1, overflow: overflow??TextOverflow.ellipsis,textAlign:textAlign ?? TextAlign.justify)),
    );
  }
}
