import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/viewmodel/paymnet_viewmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';

class FawryView extends StatelessWidget {
  FawryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(leading:  IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )), actions: []),
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                text:
                    "Please go to any fawry brunch to continue your purchase within 24 hours",
                color: primaryColor,
                fontsize: 25),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
                text: "Your redeem code is ",
                color: primaryColor,
                fontsize: 25),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: 130,
              height: 80,
              // ignore: sort_child_properties_last
              child: Center(
                child: TextSelectionTheme(
                  data: const TextSelectionThemeData(
                    selectionColor: Colors.white
                  ),
                  child: SelectableText(  
                    refCode,style: TextStyle(color: primaryColor,fontSize: 25),
                    
                  ),
                )
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: primaryColor)),
            ),
            
          ],
        ),
      ),
    ));
  }
}
