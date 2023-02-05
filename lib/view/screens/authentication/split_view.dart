import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/animation/fade_animation.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/authentication/signup_view.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';

import 'package:mandmshop/viewmodel/auth_viewmodel.dart';
import 'package:mandmshop/viewmodel/cart_viewmodel.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';

class SplitView extends GetWidget<AuthViewModel> {
   SplitView({super.key});
  List<IconData> icons=[
    (Icons.home),
    (Icons.favorite)
  ];
  final CartViewModel _cartViewModel=Get.put(CartViewModel());
  

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return   Get.find<AuthViewModel>().user==null? SignUpView() : GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => WillPopScope(
          onWillPop: ()async => false,
          child: Scaffold(
               appBar: CustomAppbar( leading: IconButton(onPressed:() {
                  zoomDrawerController.toggle!();
                }, icon: Icon(Icons.menu,color: primaryColor,)),
               actions: []
                ),
              body: controller.pageController(controller.index.value) ,
              floatingActionButton:FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: (){
                  controller.changeIndex(2);
                },child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(child: Icon(Icons.shopping_cart_outlined,color: controller.index==2?Colors.blue[600]:Colors.white,)),
                   
                      Positioned(
                        top:5 ,
                        left: 25,
                        right: 0,
                        
                        child: FadeAnimation(
                          1,
                          child: GetBuilder<CartViewModel>(
                            init: _cartViewModel,
                            
                            builder:(Ccontroller) =>  Text(Ccontroller.cart.length.toString(),style: TextStyle(color: controller.index==2?Colors.blue[600]:Colors.white,fontSize: 15),)),
                        ))
                    ],
                  ),
                ) ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
             bottomNavigationBar: AnimatedBottomNavigationBar(
              backgroundColor: primaryColor,
              activeColor: Colors.blue[600],
              inactiveColor: Colors.white,
              borderColor:primaryColor,
              splashColor: primaryColor,
            icons: icons,
            activeIndex: controller.index.value,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) {
             controller.changeIndex(index);
            },
           
             ),
          
            ),
        ),
      );
      
    },);
  }
}