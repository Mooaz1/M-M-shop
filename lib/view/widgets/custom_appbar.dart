import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utlis/constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
   CustomAppbar({
   required  this.leading,
    required this.actions,
    super.key});
    final List<Widget> actions;
    final Widget? leading;
  
  @override
  Widget build(BuildContext context) {
    return  AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: leading,
              actions: actions,
          title: Text(
            "M&M",
            style: TextStyle(
                color: primaryColor, fontSize: 30, fontStyle: FontStyle.italic),
          ),
          elevation: 0,
        );
  }
  
  @override
  // TODO: implement preferredSize
 Size get preferredSize => Size.fromHeight(kToolbarHeight);
}