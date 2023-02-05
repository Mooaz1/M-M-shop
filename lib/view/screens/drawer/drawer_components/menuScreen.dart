import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mandmshop/utlis/constants.dart';

import 'menu_item.dart';
import 'menu_items.dart';

class MenuScreen extends StatelessWidget {
  
  final DrawerMenuItem currentitem;
  final ValueChanged<DrawerMenuItem> onselecteditem;

  const MenuScreen({super.key, required this.currentitem, required this.onselecteditem});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.indigo,
          body: Theme(
            data: ThemeData.dark(),
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                 ...MenuItems.all.map(buildItem).toList(),
                    Spacer(flex: 2,),
                ],
              )
              ),
          )
          );
        
  }
 Widget buildItem(DrawerMenuItem drawerMenuItem){
  return ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
      selectedColor: primaryColor,
      selected:  currentitem==drawerMenuItem,
      leading: Icon(drawerMenuItem.icon),
      title: Text(drawerMenuItem.name),
      onTap: ()=> onselecteditem(drawerMenuItem)
    ),
  );

  }
}