import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../utlis/constants.dart';
import '../../../widgets/custom_appbar.dart';

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(leading: IconButton(
              icon:  Icon(Icons.menu,color: primaryColor),
              onPressed: () {
                zoomDrawerController.toggle!();
              },
            ), actions: [])
    );
  }
}