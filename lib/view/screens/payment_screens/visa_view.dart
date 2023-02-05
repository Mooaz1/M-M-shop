import 'package:flutter/material.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';



class VisaView extends StatefulWidget {
  const VisaView({super.key});

  @override
  State<VisaView> createState() => _VisaViewState();
}

class _VisaViewState extends State<VisaView> {
    WebViewController? _controller;

 void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://accept.paymob.com/api/acceptance/iframes/727994?payment_token==$finalTokenCard"));
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )), actions: []),
        body: WebViewWidget(controller: _controller!));
  }
}
