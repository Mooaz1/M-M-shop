import 'package:get/get.dart';
import 'package:mandmshop/core/model/cart_model.dart';
import 'package:mandmshop/core/model/payment_model/first_token_model.dart';
import 'package:mandmshop/core/services/shared/dio_helper.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/viewmodel/cart_viewmodel.dart';

class PaymentViewModel extends GetxController {
  

  Future getFirstToken(String fname , String lemail,String email,String phonenumber
      ) async {
    try {
      await DioHelper.postData(
          url: "auth/tokens", data: {"api_key": paymobApiKey}).then((value) {
        paymobFirstToken = value.data['token'];
        print("Firts tolen" + paymobFirstToken);
         print("Firts tolen" + value.data['token']);
      });
    await  getOrderId(fname, lemail, email, phonenumber);
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  CartViewModel _cartViewModel = Get.find();

  Future getOrderId(String fname , String lemail,String email,String phonenumber
     ) async {
    try {
      double price = _cartViewModel.totalPrice;
      price = price * 100;
      await DioHelper.postData(url: "ecommerce/orders", data: {
        "auth_token": paymobFirstToken,
        "delivery_needed": "false",
        "currency": "EGP",
        "amount_cents": "$price",
        "items": []
      }).then((value) {
        orderId = value.data['id'].toString();
        print("Order ID:  " + orderId);
      });
    await  getFinalTokenCard(price,fname, lemail, email, phonenumber);
     
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getFinalTokenCard(double price,String fname , String lemail,String email,String phonenumber) async {
    try {
      await DioHelper.postData(url: "acceptance/payment_keys", data: {
        "auth_token": paymobFirstToken,
        "amount_cents": "$price",
        "expiration": 3600,
        "order_id": orderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name":fname,
          "street": "NA",
          "building": "NA",
          "phone_number": phonenumber,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lemail,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": 3358877,
        "lock_order_when_paid": "false"
      }).then((value) {
        finalTokenCard = value.data['token'].toString();
        print("tinal Token:  " + finalTokenCard);
      });
      getFinalTokenKiosk(
          );
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getFinalTokenKiosk( ) async {
    try {
      await DioHelper.postData(url: "acceptance/payment_keys", data: {
        "auth_token": paymobFirstToken,
        "amount_cents": "299000",
        "expiration": 3600,
        "order_id": orderId,
        "billing_data": {
          "apartment": "NA",
          "email": "test@test.com",
          "floor": "NA",
          "first_name": "moaz",
          "street": "NA",
          "building": "NA",
          "phone_number": "01128532591",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "mohamed",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": integretedIdKoisk,
        "lock_order_when_paid": "false"
      }).then((value) {
        finalTokenKoisk = value.data['token'].toString();
        print("tinal kioksk:  " + finalTokenKoisk);
      });
      getRefCode();
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getRefCode() async {
    try {
      await DioHelper.postData(url: "acceptance/payments/pay", data: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        "payment_token": finalTokenKoisk
      }).then((value) {

        refCode = value.data['id'].toString();
        print("ref code:  " + refCode);
      });
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
