import 'package:flutter/material.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';


class CustomButton extends StatelessWidget {
   CustomButton({super.key,
  this.maximumSize=null,
   required this.onPressed,
   required this.padding,
   required this.shape,
   required this.text,
   required this.fontSize});
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
 final  MaterialStateProperty<OutlinedBorder?>? shape;
 final String text;
 final double fontSize;
 final void Function()? onPressed;
 final MaterialStateProperty<Size?>? maximumSize;
  

  
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
         maximumSize:maximumSize ,
            backgroundColor: MaterialStateProperty.all(primaryColor),
            padding: padding,
            shape:shape),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: Colors.white,
          fontsize: fontSize,
          alignment: Alignment.center,
        ));
  }
}
