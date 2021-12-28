//
//
//
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:astro_tak/AppManager/app_color.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class MyWebViewPage extends StatefulWidget {
//
//   final String url;
//
//   const MyWebViewPage({Key? key, required this.url}) : super(key: key);
//
//
//   @override
//   MyWebViewPageState createState() => MyWebViewPageState();
// }
//
// class MyWebViewPageState extends State<MyWebViewPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColor.primaryColor,
//       child: SafeArea(
//         child:  Scaffold(
//           body: Stack(
//             children: [
//               WebView(
//                 initialUrl: widget.url,
//               ),
//               IconButton(icon: const Icon(Icons.arrow_back,
//                 color: Colors.black,), onPressed: (){
//                 Navigator.pop(context);
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }