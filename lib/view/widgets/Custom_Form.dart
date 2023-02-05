import 'package:flutter/material.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:sizer/sizer.dart';

class CustomTextForm extends StatefulWidget {
  CustomTextForm({
    Key? key,
    this.hintText=null,
    this.enabled=true,
    this.isObsecure=false,
    this.textInputType=TextInputType.name,
    required this.validator,
    required this.prefixIcon,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final Widget prefixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool isObsecure;
  final String ?hintText;
  bool enabled;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
   bool scure=true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 8.h,
        width: 80.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: primaryColor, width: 1)),
        child: Center(
            child: TextFormField(
              keyboardType:widget.textInputType ,
          controller: widget.controller,
          validator: widget.validator,
          enabled:widget.enabled ,
          obscureText:widget.isObsecure?scure:widget.isObsecure,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObsecure?IconButton(onPressed: (() {
                setState(() {
                  scure=!scure;
                });
              }), icon: Icon(Icons.remove_red_eye,color: !scure?primaryColor:Colors.grey,)):null,
              hintText:widget.hintText ,
              labelText: widget.labelText),
        )));
  }
}
