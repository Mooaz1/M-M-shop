import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mandmshop/view/screens/authentication/split_view.dart';
import 'package:mandmshop/view/screens/home/home.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/view/widgets/custom_search.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';
import 'package:sizer/sizer.dart';

import '../../../utlis/constants.dart';
import '../../widgets/custom_fav_button.dart';
import '../../widgets/custom_gridview.dart';
import '../details_screens/product_details_view.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        appBar: CustomAppbar(
            leading: IconButton(
                onPressed: (() {
                  Get.to(SplitView());
                }),
                icon: Icon(
                  Icons.arrow_back,
                  color: primaryColor,
                )),
            actions: []),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                CustomSearch(
                  onTap: null,
                  onChanged: (value) {
                    controller.searchProduct(value);
                  },
                  controller: searchController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .61,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return CustomGridView(
                      onTap: () {
                        Get.to(ProductDetailsView(
                            model: controller.suggestions[index],
                            index: index));
                      },
                      image: controller.suggestions[index].image.toString(),
                      name: controller.suggestions[index].name!,
                      price: controller.suggestions[index].price!,
                      discount: controller.suggestions[index].discount!,
                      Fav: CustomFavButton(
                          list: controller.suggestions[index],
                          name: controller.suggestions[index].name!,
                          controller: controller,
                          index: index),
                    );
                  },
                  itemCount: controller.suggestions.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
