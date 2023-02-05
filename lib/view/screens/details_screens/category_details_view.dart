import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/core/model/product_model.dart';
import 'package:mandmshop/utlis/animation/fade_animation.dart';
import 'package:mandmshop/view/screens/details_screens/product_details_view.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/view/widgets/custom_fav_button.dart';
import 'package:mandmshop/view/widgets/custom_gridview.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';
import '../../../utlis/constants.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailsView extends StatelessWidget {
  CategoryDetailsView({required this.model, super.key});
  final List<ProductModel> model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        appBar: CustomAppbar(leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )), actions: []),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              CustomText(
                  alignment: Alignment.topLeft,
                  text: controller.categoriesName[controller.categoryIndex],
                  color: primaryColor,
                  fontsize: 25),
              SizedBox(
                height: 5.h,
              ),
              model.isEmpty
                  ? Center(
                      child: CustomText(
                          text: "Sorry this list is empty",
                          color: primaryColor,
                          fontsize: 25),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: .6,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return FadeAnimation(
                          index.toDouble(),
                          child: CustomGridView(
                            onTap: () {
                              Get.to(ProductDetailsView(
                                  model: model[index], index: index));
                            },
                            image: model[index].image.toString(),
                            name: model[index].name!,
                            price: model[index].price!,
                            discount: model[index].discount!,
                            Fav: CustomFavButton(
                              name: model[index].name!,
                              list: controller.categories[controller.categoryIndex][index],
                                controller: controller, index: index),
                          ),
                        );
                      },
                      itemCount: model.length,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
