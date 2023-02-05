import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mandmshop/core/services/shared/dio_helper.dart';
import 'package:mandmshop/utlis/binding/binding.dart';
import 'package:mandmshop/view/screens/drawer/drawer.dart';
import 'package:mandmshop/view/screens/onbording_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
int ?initScreen;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  await DioHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'M&M shop',
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        theme: ThemeData(
         
         
        ),
        home:initScreen==1&&initScreen!=null?MyDrawer(): OnBordingView(),
      ),
    );
  }
}

