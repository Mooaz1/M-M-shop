import 'package:get/get.dart';
import 'package:mandmshop/viewmodel/auth_viewmodel.dart';
import 'package:mandmshop/viewmodel/cart_viewmodel.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';
import 'package:mandmshop/viewmodel/paymnet_viewmodel.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthViewModel(),);
    Get.lazyPut((() => HomeViewModel()));
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => PaymentViewModel());
  }

}