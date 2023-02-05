import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuItems{
  static const paymnet =DrawerMenuItem("Home", Icons.home);
  static const profile =DrawerMenuItem("profile", Icons.person);
  static const share =DrawerMenuItem("Rate us", Icons.star);
  static const settings =DrawerMenuItem("settings", Icons.settings);
  static const all=<DrawerMenuItem>[
    paymnet,
    profile,
    settings,
    share,

  ];

}