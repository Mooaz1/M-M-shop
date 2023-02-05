import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/animation/fade_animation.dart';
import 'package:mandmshop/view/screens/payment_screens/fawry_view.dart';
import 'package:mandmshop/view/screens/payment_screens/visa_view.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import '../../../utlis/constants.dart';

class ToggleView extends StatelessWidget {
  const ToggleView({super.key});

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
        backgroundColor: Colors.white,
        body:SizedBox(
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 5.h,),
                FadeAnimation(
                  .8,
                  child: CustomText(
                    alignment: Alignment.topLeft,
                    text: "Choose your payment method", color: primaryColor, fontsize: 25),
                ),
                  SizedBox(height: 5.h,),
                FadeAnimation(
                  .9,
                  child: InkWell(
                    onTap: () {
                      Get.to(VisaView());
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: primaryColor
                            ),
                            image:const DecorationImage(  
                              image: NetworkImage("https://i.guim.co.uk/img/media/c89660880b84908a893d3bab521bdcd6a7ea6106/0_34_3500_2101/master/3500.jpg?width=465&quality=85&dpr=1&s=none"),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        SizedBox(height: .5.h,),
                        CustomText(text: "Visa Card", color: primaryColor, fontsize: 20)
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 6.h,),
                 FadeAnimation(
                  1,
                   child: InkWell(
                    onTap: () {
                      Get.to(FawryView());
                    },
                     child: Column(
                       children: [
                         Container(
                          width: 80.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: primaryColor
                            ),
                            image:const DecorationImage(  
                              image: NetworkImage("https://www.eaefund.org/2020-Website/wp-content/uploads/2020/02/fawry.jpg"),
                              fit: BoxFit.fill
                            )
                          ),
                                   ),
                                   SizedBox(height: .5.h,),
                          CustomText(text: "Fawry", color: primaryColor, fontsize: 20)
                       ],
                     ),
                   ),
                 )
              ],

            ),
          ),
        ) ,
    );
  }
}