



import 'dart:io';

import 'package:flutter/material.dart';

import 'package:astro_tak/AppManager/alert_dialogue.dart';

import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import 'package:astro_tak/AppManager/my_text_theme.dart';
import 'package:astro_tak/AppManager/app_color.dart';

import 'package:astro_tak/AppManager/user_data.dart';

class CommonWidgets{

  UserData user=UserData();



  shimmerEffect({
    required Widget child,
    required bool shimmer,
  }){
    return (shimmer)? Shimmer.fromColors(
        baseColor:  Colors.grey,
        highlightColor: Colors.white,
        child: child
    ):child;
  }

  showNoData({
    required bool show,
     bool? showLoader,
    Widget? child,
    String? title,
    String? loaderTitle,
    Color? color,
}){
    return show?
    Padding(
      padding: const EdgeInsets.fromLTRB(0,20,0,60),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                child: Lottie.asset('assets/no_data_found.json')),
            Text(title??'NO Data Found',
            style: MyTextTheme().mediumPCB.copyWith(
              color: color??AppColor.primaryColor
            ),),
          ],
        ),
      ),
    ):
    (
        ((showLoader?? false))?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                child: Lottie.asset('assets/progressAnimation.json')),
            shimmerEffect(
              shimmer: true,
              child: Text(loaderTitle??'Loading Data',
                style: MyTextTheme().mediumPCB.copyWith(
                    color: color??AppColor.primaryColor
                ),),
            ),
          ],
        )
            :child
    );

  }

  drawerButton(context,{
    onPress
  }){
    return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(0,0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      child: Icon(Icons.list,
        color: AppColor.white,
        size: 25,),
      onPressed: (){
        onPress();
      },
    );

  }




  appBarWidget(context,title){
    return  Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CommonWidgets().backButton(context,)
            ],
          ),
        ),
        Text(title.toString(),
          style: MyTextTheme().mediumPCB,),
        Expanded(child: Container())
      ],
    );
  }


  backButton(context,{
    Color? color
  }){
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(0,0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      child: Icon(Icons.arrow_back,
      color: color?? AppColor.white,
      size: 25,),
      onPressed: (){
        Navigator.pop(context);
      },
    );

  }


  selectableBox({
    required bool value,
    required Function onPress
}){
    return TextButton(
        style: TextButton.styleFrom(
            primary: Colors.black,
            padding: const EdgeInsets.all(8),
            minimumSize: const Size(0,0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
      onPressed: (){
        onPress();
      },
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          border: Border.all(color: AppColor.greyDark)
        ),
        child: Visibility(
          visible: value,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.green,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),

            ),
          ),
        ),
      ),
    );
  }

  appLogo({
    double? size
  }){
    return SizedBox(
        height: size?? 120,
        child: const Image(image: AssetImage('assets/logoSMS.png'),));
  }

  appLogoExtended(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,0,20,0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('STUDENT\nPortal',
                textAlign: TextAlign.end,
                style: MyTextTheme().customLargePCB.copyWith(
                  color: AppColor.white
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    thickness: 4,
                    color: AppColor.white,
                  ),
                ),
                const SizedBox(
                    height: 120,
                    child: Image(image: AssetImage('assets/logoSMS.png'),)),
              ],
            ),
          ),
        ),
      ),
    );
  }



  euLogo(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,10,20,0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Era\nUniversity'.toUpperCase(),
              textAlign: TextAlign.end,
              style: MyTextTheme().mediumPCB,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VerticalDivider(
                thickness: 4,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(
                height:  50,
                child: Image(image: AssetImage('assets/eraLogo.png'),)),
          ],
        ),
      ),
    );
  }
  euLogoCircular(){
    return const SizedBox(
        height:  100,
        child: Image(image: AssetImage('assets/eraCircularLogo.png'),));
  }


  appTitle(){
    return Text('Radius',
    style: MyTextTheme().largePCB,);
  }








  _onPressLogOut(context){
    AlertDialogue().show(context,
        msg: 'Do you want to LogOut?',
        showCancelButton: true,
        firstButtonName: 'LogOut',
        showOkButton: false,
        firstButtonPressEvent: () async{
          await user.removeUserData();
          Navigator.pop(context);
        //  App().replaceNavigate(context, const LoginPageView());
        }
    );
  }



  bgDecoration(){
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/loginBG.png',),
        fit: BoxFit.fill
      )
    );
  }

  containerDecoration(){
    return BoxDecoration(
        color: AppColor.white,
        borderRadius:
        const BorderRadius.all(Radius.circular(5)));
  }


  chooseFileLook(file){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.greyDark),
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                            color: AppColor.greyDark
                        )

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Choose File',
                        style: MyTextTheme().mediumBCB,),
                    )),
                const SizedBox(width: 4,),
                Visibility(
                  visible: file=='',
                  child: Text('No File chosen',
                    style: MyTextTheme().mediumBCN,),
                ),
              ],
            ),
            Visibility(
              visible: file!='',
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    image: file.contains('http')?
                    DecorationImage(
                        image:  NetworkImage(file)
                    )
                        :DecorationImage(
                        image:  FileImage(File(file))
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }







}