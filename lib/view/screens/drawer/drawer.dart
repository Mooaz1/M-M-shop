import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/drawer/drawer_screens/home_screen.dart';
import 'package:mandmshop/view/screens/drawer/drawer_screens/profile_screen.dart';
import 'package:mandmshop/view/screens/drawer/drawer_screens/settings_screen.dart';
import 'package:mandmshop/view/screens/drawer/drawer_screens/share_screen.dart';
import 'drawer_components/menuScreen.dart';
import 'drawer_components/menu_item.dart';
import 'drawer_components/menu_items.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  DrawerMenuItem current_item = MenuItems.paymnet;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        controller: zoomDrawerController,
        borderRadius: 24,
        style: DrawerStyle.defaultStyle,
        // showShadow: true,
        openCurve: Curves.fastOutSlowIn,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        duration: const Duration(milliseconds: 500),
        // angle: 0.0,
        menuBackgroundColor: Colors.indigo,
        showShadow: true,
        drawerShadowsBackgroundColor: Colors.black,
        shadowLayer2Color: primaryColor,
        angle: -15,
        mainScreen: getScreens(),
        menuScreen: Builder(
          builder: (context) {
            return MenuScreen(
              currentitem: current_item,
              onselecteditem: ((item) {
                setState(() {
                  current_item = item;
                });
                ZoomDrawer.of(context)!.close();
              }),
            );
          },
        ));
  }

  Widget getScreens() {
    switch (current_item) {
      case MenuItems.paymnet:
        return HomeScreen();
      case MenuItems.profile:
        return Profile();
      case MenuItems.share:
        return Share();
      default:
        return Settings();
    }
  }
}
