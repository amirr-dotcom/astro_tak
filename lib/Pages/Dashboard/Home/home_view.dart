



import 'package:astro_tak/AppManager/app_color.dart';
import 'package:astro_tak/AppManager/my_text_theme.dart';
import 'package:astro_tak/AppManager/widgets/date_time_field.dart';
import 'package:astro_tak/AppManager/widgets/my_text_field.dart';
import 'package:astro_tak/AppManager/widgets/my_text_field_2.dart';
import 'package:astro_tak/Pages/Dashboard/Home/home_controller.dart';
import 'package:astro_tak/Pages/Dashboard/Home/home_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {



  HomeModal modal=HomeModal();


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) {
        return ListView(
          children: [
            Row(
              children: [
                const Icon(Icons.arrow_back_ios,
                color: Colors.black,),
                Expanded(
                  child: Text('Daily Panchang',
                  style: MyTextTheme().mediumBCB,),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Text('India is the country known for its festival but knowing the exact dates can '
                'some times be difficult. To ensure you do not miss out on the critical date '
                'we bring you the daily panchang',
            style: MyTextTheme().smallGCN,),
            const SizedBox(height: 10,),
            Container(
              color: AppColor.secondaryColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,25,20,25),
                child: Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                          flex: 2,
                          child: Text('Date: ',
                          textAlign: TextAlign.end,
                          style: MyTextTheme().mediumGCN,),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                            flex: 7,
                            child: MyDateTimeField(
                              onChanged: (val){
                                modal.getPanchangs(context);
                              },
                              controller: modal.controller.dateC.value,
                              hintText: 'Select Date',
                            )),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [

                        Expanded(
                          flex: 2,
                          child: Text('Location: ',
                            textAlign: TextAlign.end,
                            style: MyTextTheme().mediumGCN,),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                            flex: 7,
                            child: Stack(
                              children: [
                                MyTextField2(
                                  searchedList: modal.controller.placeData,
                                  showSearchedList: !(modal.controller.placeData.map((e) => e['placeName']).toList()
                                      .contains( modal.controller.locationC.value.text)),
                                  onTapSearchedData: (val){
                                    modal.controller.selectedPlace.value.placeName=val['placeName'].toString();
                                    modal.controller.selectedPlace.value.placeId=val['placeId'];
                                    modal.controller.locationC.value.text=val['placeName'];
                                    modal.controller.update();
                                    setState(() {

                                    });
                                    modal.getPanchangs(context);
                                  },
                                  searchParam: 'placeName',
                                  controller: modal.controller.locationC.value,
                                  hintText: 'Search Location',
                                  onChanged: (val){
                                    if(val!=''){
                                      
                                      if(!modal.controller.placeData.map((e) => e['placeName']).toList()
                                      .contains( modal.controller.locationC.value.text)
                                     )
                                        {
                                          modal.getLocation(context);
                                        }

                                    }
                                    else{
                                      modal.controller.placeData.clear();
                                      modal.controller.update();
                                    }
                                    setState(() {

                                    });
                                  },
                                ),

                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        Visibility(
          visible: modal.controller.getPlaces.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              modal.controller.panchangData.isEmpty? Container():Container(
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0,2)
                      )
                    ]
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    upperData("Sunrise",modal.controller.getPanchangData.sunrise.toString()),
                    upperData("Sunset",modal.controller.getPanchangData.sunset.toString()),
                    upperData("Moonrise",modal.controller.getPanchangData.moonrise.toString()),
                    upperData("Moonset",modal.controller.getPanchangData.moonset.toString()),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text('Tithi',
                style: MyTextTheme().mediumBCB,),
              const SizedBox(height: 15,),
              modal.controller.panchangData.isEmpty? Container():Column(
                children: [
                  dataWidget("Thithi Number", modal.controller.getPanchangData.tithi!.details!.tithi_number.toString()),
                  dataWidget("Thithi Name", modal.controller.getPanchangData.tithi!.details!.tithi_name.toString()),
                  dataWidget("Special", modal.controller.getPanchangData.tithi!.details!.special.toString()),
                  dataWidget("Summary", modal.controller.getPanchangData.tithi!.details!.summary.toString()),
                  dataWidget("Deity", modal.controller.getPanchangData.tithi!.details!.deity.toString()),
                  dataWidget("End Time", (
                      modal.controller.getPanchangData.tithi!.end_time!['hour'].toString()+' hr'+
                          modal.controller.getPanchangData.tithi!.end_time!['minute'].toString()+' min'+
                          modal.controller.getPanchangData.tithi!.end_time!['second'].toString()+' sec'
                  )),
                ],
              ),

              const SizedBox(height: 20,),
              Text('Nakshatra',
                style: MyTextTheme().mediumBCB,),
              const SizedBox(height: 15,),
              modal.controller.panchangData.isEmpty? Container():Column(
                children: [
                  dataWidget("Nakshatra Number", modal.controller.getPanchangData.nakshatra!.details!.nak_number.toString()),
                  dataWidget("Nakshatra Name", modal.controller.getPanchangData.nakshatra!.details!.nak_name.toString()),
                  dataWidget("Special", modal.controller.getPanchangData.nakshatra!.details!.special.toString()),
                  dataWidget("Ruler", modal.controller.getPanchangData.nakshatra!.details!.special.toString()),
                  dataWidget("Summary", modal.controller.getPanchangData.nakshatra!.details!.summary.toString()),
                  dataWidget("Deity", modal.controller.getPanchangData.nakshatra!.details!.deity.toString()),
                  dataWidget("End Time", (
                      modal.controller.getPanchangData.nakshatra!.end_time!['hour'].toString()+' hr'+
                          modal.controller.getPanchangData.nakshatra!.end_time!['minute'].toString()+' min'+
                          modal.controller.getPanchangData.nakshatra!.end_time!['second'].toString()+' sec'
                  )),
                ],
              ),
            ],
          ),
        )


          ],
        );
      }
    );
  }





  Widget upperData(title,val){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Icon(Icons.wb_sunny,
                color: AppColor.customBlue,),
            ),
            Column(
              children: [
                Text(title,
                  style: MyTextTheme().smallBCB.copyWith(
                      color: AppColor.customBlue,
                      fontSize: 10
                  ),),
                Text(val.toString(),
                    style: MyTextTheme().smallGCN),
              ],
            ),
            const SizedBox(width: 8,),
            const VerticalDivider(
              thickness: 2,
            ),

          ],
        ),
      ),
    );
  }




  Widget dataWidget(title,val){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(title+': ',
              style: MyTextTheme().mediumGCN),
          ),
          Expanded(
            flex: 3,
            child: Text(val,
                style: MyTextTheme().mediumGCN),
          ),
        ],
      ),
    );
  }


}
