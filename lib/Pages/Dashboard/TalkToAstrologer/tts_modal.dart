

import 'dart:developer';

import 'package:astro_tak/AppManager/alert_dialogue.dart';
import 'package:astro_tak/AppManager/app_util.dart';
import 'package:astro_tak/Pages/Dashboard/TalkToAstrologer/tts_controller.dart';
import 'package:get/get.dart';

class TTSModal {
  
  App app=App();

  TTSController controller=Get.put(TTSController());






  // Api Call
  
  
  Future<void> getAllAstrologers(context) async{
    controller.updateShowNoData=false;
    var data=await app.getApi("agent/all", context);
   // log(data.toString());
    controller.updateShowNoData=true;
    if(data['success']){
      controller.updateAstronomersData(data['data']);
    }
    else {
      alertToast(context, data['message']);
    }

    
  }


}