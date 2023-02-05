import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/animation/fade_animation.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/details_screens/category_details_view.dart';
import 'package:mandmshop/view/screens/details_screens/product_details_view.dart';
import 'package:mandmshop/view/screens/home/search_view.dart';
import 'package:mandmshop/view/widgets/custom_fav_button.dart';
import 'package:mandmshop/view/widgets/custom_gridview.dart';
import 'package:mandmshop/view/widgets/custom_search.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                FadeAnimation(1,
                    child: CustomSearch(
                      onTap: () {
                        Get.to(SearchView());
                      },
                      controller: null,
                      onChanged: null,
                    )),
                SizedBox(
                  height: 5.h,
                ),
                FadeAnimation(
                  1.3,
                  child: HeaderOffers(
                    controller: controller,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                FadeAnimation(
                  1.5,
                  child: CustomText(
                    text: "Category",
                    color: primaryColor,
                    fontsize: 25,
                    alignment: Alignment.topLeft,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FadeAnimation(
                  1.5,
                  child: SizedBox(
                    height: 11.h,
                    child: CategoryListView(
                      controller: controller,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                FadeAnimation(
                  1.7,
                  child: CustomText(
                    text: "Trends",
                    color: primaryColor,
                    fontsize: 25,
                    alignment: Alignment.topLeft,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                FadeAnimation(
                  1.8,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .63,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return CustomGridView(
                        onTap: () {
                          Get.to(ProductDetailsView(
                              model: controller.trends[index], index: index));
                        },
                        image: controller.trends[index].image.toString(),
                        name: controller.trends[index].name!,
                        price: controller.trends[index].price!,
                        discount: controller.trends[index].discount!,
                        Fav: CustomFavButton(
                            list: controller.trends[index],
                            name: controller.trends[index].name!,
                            controller: controller,
                            index: index),
                      );
                    },
                    itemCount: controller.trends.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderOffers extends StatelessWidget {
  HeaderOffers({
    required this.controller,
    Key? key,
  }) : super(key: key);

  HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: controller.offers.length,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Container(
              width: 90.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(controller.offers[index]),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(30)),
              child: InkWell(
                onTap: () {
                  print(index);
                },
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 900),
        ));
  }
}

class CategoryListView extends StatelessWidget {
  CategoryListView({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final HomeViewModel? controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller!.changeCategoryIndex(index);
              Get.to(CategoryDetailsView(
                  model: controller!.categories[controller!.categoryIndex]));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${controller!.category[index].image}"),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                    text: controller!.category[index].name,
                    color: primaryColor,
                    fontsize: 20)
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
        itemCount: controller!.category.length);
  }
}
