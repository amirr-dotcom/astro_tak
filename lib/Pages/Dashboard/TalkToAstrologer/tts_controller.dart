


import 'package:astro_tak/DataModals/TTAstronomers/astronomers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TTSController extends GetxController {



// Filter List
  List filterList=[].obs;
  List get getFilterList=>filterList;
  set updateFilterList(List val){
    filterList=val;
    update();
  }

  RxString selectedFilter='All'.obs;
  String get getSelectedFilter=>selectedFilter.value;
  set updateSelectedFilter(String val){
    selectedFilter.value=val;
    update();
  }




  RxBool showNoData=false.obs;
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }

  Rx<TextEditingController> searchC=TextEditingController().obs;


  // Sorting
  RxInt selectedSort=0.obs;
  int get getSelectedSort=>selectedSort.value;
  set updateSelectedSort(int val){
    selectedSort.value=val;
    update();
  }
  List astronomersData=[].obs;

  List get _searchedList=>(
      searchC.value.text==''?
      astronomersData:
      astronomersData.where((element) =>

          (
              element['firstName'].toString()
                  +' '+element['lastName'].toString()+
                  element['languages'].toString()+
                  element['skills'].toString()
          ).toString().toLowerCase().trim()
              .contains(searchC.value.text.toLowerCase().trim())
      ).toList()
  );




  List _getListAccordingToSort(){
    switch(getSelectedSort){
      case 1:
        return _searchedList..sort((a, b) => b['experience'].compareTo(a['experience']));
      case 2:
        return _searchedList..sort((a, b) => a['experience'].compareTo(b['experience']));
      case 3:
        return _searchedList..sort((a, b) => b['minimumCallDurationCharges'].compareTo(a['minimumCallDurationCharges']));
      case 4:
        return _searchedList..sort((a, b) => a['minimumCallDurationCharges'].compareTo(b['minimumCallDurationCharges']));
      default:
        return _searchedList;
    }
  }


  List _getListAccordingToFilter(){


    return  getSelectedFilter=='All'?

    _getListAccordingToSort():   _getListAccordingToSort().where(
            (element) =>   (
                    element['languages'].toString()+
                    element['skills'].toString()
            ).toString().toLowerCase().trim().contains(getSelectedFilter.toLowerCase().trim())
    ).toList();
    
 
  }


  List<AstronomersDataModal> get getAstronomers=>List<AstronomersDataModal>.from(
      (
          _getListAccordingToFilter()
      )
      .map((element) => AstronomersDataModal.fromJson(element))
  );
  Future updateAstronomersData(List val) async{
    astronomersData=val;
    filterList.clear();

    update();
    for(int i=0; i<getAstronomers.length; i++){


        for(int j=0; j<getAstronomers[i].skills!.length; j++){
          if(!filterList.contains(getAstronomers[i].skills![j]['name'].toString())){
            filterList.insert(0,getAstronomers[i].skills![j]['name'].toString());
          }


        }



        for(int k=0; k<getAstronomers[i].languages!.length; k++){

          if(!filterList.contains(getAstronomers[i].languages![k]['name'])){
            filterList.add(getAstronomers[i].languages![k]['name']);
          }

        }

    }


    filterList.insert(0,'All');

  }





  List sortingList=[
    {
      'id': 1,
      'title': 'Experience- high to low'
    },
    {
      'id': 2,
      'title': 'Experience- low to high'
    },
    {
      'id': 3,
      'title': 'Price- high to low'
    },
    {
      'id': 4,
      'title': 'Price- low to low'
    },
  ];





}