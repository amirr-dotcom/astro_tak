//
//
// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:astro_tak/AppManager/app_color.dart';
//
//
//
// class ImageView extends StatefulWidget {
//
//   final String tag;
//   final String file;
//
//   const ImageView({ Key? key, required this.tag, required this.file}) : super(key: key);
//
//
//   @override
//   _ImageViewState createState() => _ImageViewState();
// }
//
// class _ImageViewState extends State<ImageView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColor.primaryColor,
//       child: SafeArea(
//         child: Material(
//           child: Stack(
//             children: [
//               Hero(
//                 tag: widget.tag,
//                 child: PhotoView(
//                   imageProvider: NetworkImage(widget.file.trim().toString()),
//                 ),
//               ),
//               IconButton(icon: const Icon(Icons.arrow_back,
//                 color: Colors.white,), onPressed: (){
//                 Navigator.pop(context);
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
