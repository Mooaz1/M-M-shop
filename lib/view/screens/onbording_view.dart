import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/authentication/signup_view.dart';
import 'package:mandmshop/view/widgets/custom_button.dart';

import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingView extends StatefulWidget {
 const OnBordingView({super.key});

  @override
  State<OnBordingView> createState() => _OnBordingViewState();
}

class _OnBordingViewState extends State<OnBordingView> {
  int currentPage=0;
  List<String> images = [
    'assets/images/on1.jpg',
    'assets/images/on2.jpg',
    'assets/images/on3.jpg'
  ];

  var liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    final height = SizerUtil.height;
    final width = SizerUtil.width;
    return Scaffold(
        body: Stack(children: [
         
          LiquidSwipe(
          initialPage: currentPage,
          onPageChangeCallback: (activePageIndex) {
            setState(() {
              currentPage=activePageIndex;
            });
          },
          enableLoop: false,
          liquidController: liquidController,
          pages: [
            BuildLiquidSwipePage(
              height: height,
              width: width,
              image: images[0],
              title: "Purche online",
              description:
                  "with M&M shop you can purche frm anywhere and from any platform ",
              onPressed: () {
                liquidController.animateToPage(page: 1, duration: 400);
              },
            ),
            BuildLiquidSwipePage(
              height: height,
              width: width,
              image: images[1],
              title: "Easy payment",
              description: "with M&M shop you can pay in many payment methods ",
              onPressed: () {
                liquidController.animateToPage(page: 2, duration: 400);
              },
            ),
            BuildLiquidSwipePage(
              height: height,
              width: width,
              lastPage: true,
              image: images[2],
              title: "Express delivery",
              description:
                  "with M&M shop you will get your need in any place inside Egypt ",
              onPressed: () {
               Get.offAll(SignUpView());
              },
            ),
          ],
        ),
        Positioned(
          bottom: height*.03,
          left: width*.35,
         
          child: AnimatedSmoothIndicator(  
            activeIndex: liquidController.currentPage,
            count: 3,
            effect: WormEffect(
              activeDotColor: primaryColor,
              dotHeight:16,
              dotWidth: 30
            ),
          ))
        ],));
  }
}

class BuildLiquidSwipePage extends StatelessWidget {
  const BuildLiquidSwipePage({
    Key? key,
    required this.image,
    this.lastPage = false,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  final String image;
  final String title;
  final String description;
  final void Function()? onPressed;
  final bool lastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizerUtil.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * .4,
            width: width * .95,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: height * .07,
          ),
          Text(
            title,
            style:const TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Container(
              margin: EdgeInsets.only(left: width * .12),
              height: height * .1,
              width: width * .6,
              child: Center(
                  child: Text(
                description,
                style:const TextStyle(
                  fontSize: 20,
                ),
              ))),
          SizedBox(
            height: height * .05,
          ),
          Container(
            width: width * .4,
            child: CustomButton(
                onPressed: onPressed,
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
                text: lastPage ? "SignUp" : "Continue",
                fontSize: 25),
          )
        ],
      ),
    );
  }
}
