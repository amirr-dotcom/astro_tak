


import 'dart:developer';

import 'package:astro_tak/AppManager/alert_dialogue.dart';
import 'package:astro_tak/AppManager/app_util.dart';
import 'package:astro_tak/AppManager/progress_dialogue.dart';
import 'package:astro_tak/AppManager/raw_api.dart';
import 'package:astro_tak/Pages/Dashboard/Home/home_controller.dart';

class HomeModal {

  HomeController controller=HomeController();
  App app=App();


  // Api Call
  Future<void> getLocation(context) async{

    var data=await app.getApi("location/place?inputPlace="+controller.locationC.value.text, context);
    // log(data.toString());
    if(data['success']){
      controller.updatePlaceData=data['data'];
    }
    else {
      alertToast(context, data['message']);
    }


  }


  Future<void> getPanchangs(context) async{

    print(controller.dateC.value.text);
    print(controller.selectedPlace.value.placeId.toString());



    if(controller.dateC.value.text==''){
      alertToast(context, 'Please Select Date');
    }
    else if(controller.selectedPlace.value.placeId==null){
      alertToast(context, 'Please Select Location');
    }
    else{

      ProgressDialogue().show(context, loadingText: 'Getting Panchang');
      var body={
        "day": controller.dateC.value.text.split('-')[2],
        "month": controller.dateC.value.text.split('-')[1],
        "year": controller.dateC.value.text.split('-')[0],
        "placeId": controller.selectedPlace.value.placeId.toString()
      };
      var data=await RawApi().api("horoscope/daily/panchang",body, context);
      ProgressDialogue().hide();
      log(data.toString());
      if(data['success']){
        alertToast(context, data['message']);
        controller.updatePanchangData=data['data'];
      }
      else {
        alertToast(context, data['message']);
      }

    }



  }

  

}