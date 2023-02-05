import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.onPressed,
    required this.assetImage,
    Key? key,
  }) : super(key: key);
  final void Function()? onPressed;
  final String assetImage;
  

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,
     child: Container(
      height: 9.h,
      width: 9.h,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(  
          image: AssetImage(assetImage),
          fit: BoxFit.cover
        )
      ),
    ));
  }
}
