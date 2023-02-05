import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key ,
   this.maxLinesOne,
   required this.text, required this.color, required this.fontsize,this.alignment});
  final String? text;
  final Color color;
  final double fontsize;
  final AlignmentGeometry ?alignment;
  final int? maxLinesOne;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment,
      child:  Text(text!=null?text!:"",
      
     maxLines: maxLinesOne,
      overflow:  maxLinesOne!=null?TextOverflow.ellipsis:null,
          style: TextStyle(
            color:color,
            fontSize: fontsize
          ),),
    );
  }
}