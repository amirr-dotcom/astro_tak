import 'dart:io';

import 'package:astro_tak/AppManager/alert_dialogue.dart';
import 'package:astro_tak/AppManager/my_text_theme.dart';



import 'package:astro_tak/AppManager/widgets/my_app_bar.dart';
import 'package:astro_tak/Pages/Dashboard/TalkToAstrologer/talk_to_astrolger.dart';
import 'package:astro_tak/Pages/wii_available_soon.dart';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AppManager/app_color.dart';
import 'Home/home_view.dart';



class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {













  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async{

  }

  @override
  void dispose() {
    // Don't forget to close all the stream
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }









  @override
  Widget build(BuildContext context) {

    final _tabs=[
      const HomeView(),
      const TalkToAstrologer(),
      const WillAvailablSoon(),
      const WillAvailablSoon(),
      const WillAvailablSoon(),
    ];
    return SimpleBuilder(
        builder: (_) {
          return Container(
            color: AppColor.primaryColor,
            child: SafeArea(
              child: Container(
                color: Colors.white,
                child: WillPopScope(
                  onWillPop: () async{
                    await AlertDialogue().show(context,
                        msg: 'Do you want to exit the app?',
                        showCancelButton: true,
                        showOkButton: false,
                        firstButtonName: 'Exit',
                        firstButtonPressEvent: (){
                          exit(0);
                        }
                    );
                    setState(() {

                    });
                    return Future.value(false);
                  },
                  child: Scaffold(
                    backgroundColor: AppColor.white,
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      leading: TextButton(
                        style: TextButton.styleFrom(
                            primary: AppColor.primaryColor
                        ),
                        onPressed: (){
                          alertToast(context, 'Will Available Soon');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(image: AssetImage('assets/hamburger.png'),),
                        ),
                      ),
                      title: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Image(image: AssetImage('assets/logo.png'),
                        height: 40),
                      ),
                      centerTitle: true,
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: AppColor.primaryColor
                          ),
                          onPressed: (){
                            alertToast(context, 'Will Available Soon');
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(image: AssetImage('assets/profile.png'),),
                          ),
                        ),
                      ],
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Expanded(child: _tabs[_selectedIndex]),
                        ],
                      ),
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      backgroundColor: AppColor.greyDark,
                      unselectedItemColor: Colors.grey,
                      selectedLabelStyle: MyTextTheme().smallPCB.copyWith(
                        fontSize: 8
                      ),
                      unselectedLabelStyle: MyTextTheme().smallGCB.copyWith(
                          fontSize: 8
                      ),
                      showUnselectedLabels: true,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/home.png"),
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/talk.png"),
                          ),
                          label: 'Talk To Astrologer',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/ask.png"),
                          ),
                          label: 'Ask Question',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/reports.png"),
                          ),
                          label: 'Report',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.chat_bubble_outline),
                          label: 'Chat With Astrologer',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: Colors.amber[800],
                      onTap: _onItemTapped,
                    ),


                  ),
                ),
              ),
            ),
          );
        }
    );
  }





}
