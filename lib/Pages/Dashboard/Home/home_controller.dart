



import 'package:astro_tak/DataModals/Home/panchang_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../DataModals/Home/place_data_modal.dart';

class HomeController extends GetxController {



  Rx<TextEditingController> dateC=TextEditingController().obs;
  Rx<TextEditingController> locationC=TextEditingController().obs;


  List placeData=[].obs;
  List<PlaceDataModal> get getPlaces=>List<PlaceDataModal>.from(
      (
          placeData
      )
          .map((element) => PlaceDataModal.fromJson(element))
  );

  Rx<PlaceDataModal> selectedPlace=PlaceDataModal().obs;

  set updatePlaceData(List val){
    placeData=val;
    update();
  }




  List panchangData=[].obs;
  PanchangDataModal get getPanchangData=>panchangData.isEmpty? PanchangDataModal():List<PanchangDataModal>.from(
      (
          panchangData
      )
          .map((element) => PanchangDataModal.fromJson(element))
  )[0];


  set updatePanchangData(Map val){
    panchangData.clear();
    panchangData.add(val);
    update();
  }



}