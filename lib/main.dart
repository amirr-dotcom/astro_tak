import 'dart:async';

import 'package:astro_tak/AppManager/my_text_theme.dart';
import 'package:astro_tak/Pages/Dashboard/dashboard_view.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';



import 'package:get/get.dart';
import 'package:astro_tak/Theme/theme_service.dart';
import 'package:astro_tak/Theme/themes.dart';

import 'package:lottie/lottie.dart';


import 'AppManager/app_color.dart';
import 'AppManager/app_util.dart';
import 'AppManager/user_data.dart';







void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetStorage.init('user');
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
        builder: (_) {
          return  GetMaterialApp(
            title: 'Astro Tak',
            debugShowCheckedModeBanner: false,
            // darkTheme: ThemeData.dark(),
            themeMode: ThemeService().theme,
            theme: Themes.light,
            darkTheme: Themes.dark,
            //  theme: ThemeData(
            //    // Define the default brightness and colors.
            //    brightness: Brightness.light,
            //    primaryColor: AppColor.primaryColor,
            //    scaffoldBackgroundColor:  AppColor.primaryColor,
            //
            //
            //    // Define the default font family.
            // //   fontFamily: 'Georgia',
            //
            //    // Define the default `TextTheme`. Use this to specify the default
            //    // text styling for headlines, titles, bodies of text, and more.
            //    textTheme:   TextTheme(
            //      headline1: GoogleFonts.lato(
            //          color: AppColor.primaryColor,
            //          fontSize: 30,
            //          fontWeight: FontWeight.bold
            //      ),
            //      headline2: GoogleFonts.lato(
            //          color: AppColor.primaryColor,
            //          fontSize: 30,
            //          fontWeight: FontWeight.bold
            //      ),
            //      headline6: GoogleFonts.lato(
            //          color: AppColor.primaryColor,
            //          fontSize: 30,
            //          fontWeight: FontWeight.bold
            //      ),
            //      bodyText1: GoogleFonts.lato(
            //          color: AppColor.black,
            //          fontSize: 12,
            //          fontWeight: FontWeight.bold
            //      ),
            //      bodyText2: GoogleFonts.lato(
            //          color: AppColor.primaryColor,
            //          fontSize: 30,
            //          fontWeight: FontWeight.bold
            //      ),
            //    ),
            //  ),

            home: const MyHomePage(),
            // builder: (context,widget) {
            //
            //   return Stack(
            //     children: <Widget>[
            //       widget!,
            //       Visibility(
            //         visible: false,
            //         child: Center(
            //           child: Container(
            //             color: Colors.red,
            //             height: 300,
            //             width: 200,
            //           ),
            //         ),
            //       )
            //     ],
            //   );
            // },
          );
        }
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  App app=App();
  // FactsCount factsC=Get.put(FactsCount());







  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();

    // igonore Lit
    print(
        "                  \n"
            "         _______  \n"
            "       /   __   | \n"
            "      /  /   |  | \n"
            "     /  /____|  | \n"
            "    /  /_____|  | \n"
            "   /  /      |  | \n"
            "  /__/       |__| \n"
            "                       \n"
            "   ________    ______  \n"
            "  |   __   |  /  /|  | \n"
            "  |  |  |  | /  / |  | \n"
            "  |  |  |  |/  /  |  | \n"
            "  |  |  |__/__/   |  | \n"
            "  |  |            |  | \n"
            "  |__|            |__| \n"
            "                 \n"
            "         (())  \n"
            "          __   \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |  |  \n"
            "         |__|  \n"
            "                    \n"
            "   _____________    \n"
            "  |  | _______  |   \n"
            "  |  | ______|__|   \n"
            "  |  | |  |         \n"
            "  |  |   |  |       \n"
            "  |  |     |  |     \n"
            "  |__|       |__|   \n"
    );
    print(
        "                                        (())                    \n"
            "         _______   ________    ______    __    _____________    \n"
            "       /   __   | |   __   |  /  /|  |  |  |  |  | _______  |   \n"
            "      /  /   |  | |  |  |  | /  / |  |  |  |  |  | ______|__|   \n"
            "     /  /____|  | |  |  |  |/  /  |  |  |  |  |  | |  |         \n"
            "    /  /_____|  | |  |  |__/__/   |  |  |  |  |  |   |  |       \n"
            "   /  /      |  | |  |            |  |  |  |  |  |     |  |     \n"
            "  /__/       |__| |__|            |__|  |__|  |__|       |__|   \n"
    );
    get();
  }






  get() async{
    // await getFacts();
    page();
  }





  getFacts() async{
    // final String response = await rootBundle.loadString('assets/facts/facts.json');
    // List data = await json.decode(response)['Facts'];
    // factsC.updateFacts(data);


  }



  page()
  async{
    Timer(
        const Duration(seconds: 5),
            () =>
            pageRoute()
    );
  }





  pageRoute() async{
    // await factsC.updateFactCount();
    //  print(UserData().getHeadAssigned.toString());
    app.replaceNavigate(context, const DashboardView(),
        routeName: '/DashboardView');
    // if(UserData().getUserData.isNotEmpty)
    // {
    //   // print(UserData().getHeadAssigned.toString());
    //   // print(UserData().getHeadAssigned[0].headDescription.toString());
    //   app.replaceNavigate(context, const DashboardView(),
    //       routeName: '/DashboardView');
    // }
    // else{
    //  // App().replaceNavigate(context, const LoginPageView());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,

          body: Container(

            decoration:  const BoxDecoration(
                color: Colors.black26,
                image: DecorationImage(
                    image: AssetImage('assets/loginBG.png'),
                    fit: BoxFit.cover
                )
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(child:  SizedBox()),
                  SizedBox(
                      height: 150,
                      child: Lottie.asset('assets/progressAnimation.json')),
                  Text('Astro Tak',
                  style: MyTextTheme().largeWCB,),
                  const Expanded(child:  SizedBox()),

                  const SizedBox(height: 20,),
                  Text('We respect your privacy.\n'
                      'We hate spam as much as you do.',
                    textAlign: TextAlign.center,
                    style: MyTextTheme().smallWCN,),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
