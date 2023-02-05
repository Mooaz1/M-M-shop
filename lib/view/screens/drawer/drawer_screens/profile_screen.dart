import 'package:flutter/material.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';

import '../../../../utlis/constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(leading: IconButton(
              icon:  Icon(Icons.menu,color: primaryColor,),
              onPressed: () {
                zoomDrawerController.toggle!();
              },
            ), actions: []),
            backgroundColor: Colors.white,
            body: Column(
              children: [

              ],
            ),
    );
  }
}