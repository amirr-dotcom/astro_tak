import 'package:astro_tak/AppManager/my_text_theme.dart';
import 'package:flutter/material.dart';



class WillAvailablSoon extends StatefulWidget {
  const WillAvailablSoon({Key? key}) : super(key: key);

  @override
  _WillAvailablSoonState createState() => _WillAvailablSoonState();
}

class _WillAvailablSoonState extends State<WillAvailablSoon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Will Available Soon',
      style: MyTextTheme().mediumPCB,),
    );
  }
}
