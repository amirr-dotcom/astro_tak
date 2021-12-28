


import 'package:astro_tak/AppManager/alert_dialogue.dart';
import 'package:astro_tak/AppManager/app_color.dart';
import 'package:astro_tak/AppManager/my_text_theme.dart';
import 'package:astro_tak/AppManager/widgets/my_text_field.dart';
import 'package:astro_tak/DataModals/TTAstronomers/astronomers.dart';
import 'package:astro_tak/Pages/Dashboard/TalkToAstrologer/tts_controller.dart';
import 'package:astro_tak/Pages/Dashboard/TalkToAstrologer/tts_modal.dart';
import 'package:astro_tak/Pages/common_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TalkToAstrologer extends StatefulWidget {
  const TalkToAstrologer({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerState createState() => _TalkToAstrologerState();
}

class _TalkToAstrologerState extends State<TalkToAstrologer> {


  TTSModal modal=TTSModal();

  bool searching=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }


  get() async{
    await modal.getAllAstrologers(context);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    modal.controller.astronomersData.clear();
    modal.controller.update();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Talk To an Astrologer',
                style: MyTextTheme().mediumBCB.copyWith(
                    color: Colors.black87
                ),),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(0,0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap

              ),
              onPressed: (){
                searching=true;
                setState(() {

                });
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(image: AssetImage('assets/search.png'),
                  height: 25,),
              ),
            ),

            filterButton(),
            sortingButton(),
          ],
        ),

        AnimatedContainer(
          height: searching? 60:1,

          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,10),
            child: ListView(
              shrinkWrap: true,

              children: [
                MyTextField(

                  onChanged: (val){
                    setState(() {

                    });
                  },
                  controller: modal.controller.searchC.value,
                  hintText: 'Search Astrologers Name Language Skill',
                  prefixIcon: Icon(Icons.search,
                  color: AppColor.primaryColor,),
                  suffixIcon: IconButton(
                    onPressed: (){
                      searching=false;
                      modal.controller.searchC.value.clear();
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.close,
                      color: AppColor.primaryColor,),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GetBuilder(
            init: TTSController(),
            builder: (_) {
              return CommonWidgets().showNoData(
                show: (modal.controller.getShowNoData && modal.controller.getAstronomers.isEmpty),
                title: 'No Data Found',
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return const Divider();
                  },
                    itemCount: modal.controller.getAstronomers.isEmpty?
                    2
                    :modal.controller.getAstronomers.length,
                    itemBuilder: (context,index){
                      AstronomersDataModal astronomer=
                      modal.controller.getAstronomers.isEmpty?

                          AstronomersDataModal(
                            firstName: 'Loading Names',
                            lastName: '',
                            experience: '0',
                            minimumCallDurationCharges: '0',
                            languages: [],
                            skills: []
                          ):
                      modal.controller.getAstronomers[index];
                  return CommonWidgets().shimmerEffect(
                    shimmer: modal.controller.getAstronomers.isEmpty,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 90,
                          child:  modal.controller.getAstronomers.isEmpty?

                              Container(
                                color: Colors.white,
                              )
                              :CachedNetworkImage(
                            imageUrl: astronomer.profilePicUrl.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,),
                              ),
                            ),
                            placeholder: (context, url) => const Center(child: Image(image: AssetImage('assets/logo.png'),)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(astronomer.firstName.toString()+' '+astronomer.lastName.toString(),
                            style: MyTextTheme().mediumBCB.copyWith(
                              color: Colors.black87
                            ),),
                            const SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.work,
                                  color: AppColor.primaryColor,
                                  size: 18,),
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: Wrap(
                                    children: List.generate(astronomer.skills!.length, (index1) =>
                                        Text(astronomer.skills![index1]['name'].toString()+ (
                                            (index1==(astronomer.skills!.length-1))? '':
                                            ', '
                                        ),
                                          style: MyTextTheme().mediumGCN)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.language,
                                  color: AppColor.primaryColor,
                                  size: 18,),
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: Wrap(
                                    children: List.generate(astronomer.languages!.length, (index1) =>
                                        Text(astronomer.languages![index1]['name'].toString()+ (
                                            (index1==(astronomer.languages!.length-1))? '':
                                            ', '
                                        ),
                                            style: MyTextTheme().mediumGCN)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.card_membership,
                                color: AppColor.primaryColor,
                                size: 18,),
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: Text('\u{20B9}'+astronomer.minimumCallDurationCharges.toString()+'/ Min',
                                    style: MyTextTheme().mediumBCB.copyWith(
                                        color: Colors.black87
                                    ),),
                                ),
                              ],
                            ),


                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,30,0,20),
                              child: TextButton(
                                  onPressed: (){

                                alertToast(context, 'Will Available Soon');
                              }, child: Padding(
                                padding: const EdgeInsets.fromLTRB(10,2,10,2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.call_outlined,
                                    color: Colors.white,),
                                    const SizedBox(width: 10,),
                                    Text(
                                      'Talk On Call',
                                      style: MyTextTheme().mediumWCN,
                                    ),
                                  ],
                                ),
                              ),
                                style: TextButton.styleFrom(
                                  primary: AppColor.black,
                                  backgroundColor: AppColor.primaryColor,
                                ),
                              ),
                            )

                          ],
                        )),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(astronomer.experience.toString().split('.')[0]+' Years',
                          style: MyTextTheme().mediumGCN,),
                        ),
                      ],
                    ),
                  );
                }),
              );
            }
          ),
        ),
      ],
    );
  }


  Widget filterButton(){
    return PopupMenuButton(
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(image: AssetImage('assets/filter.png'),
          height: 25,),
      ),
      onSelected: (result) {
        modal.controller.updateSelectedFilter=result.toString();
      },
      itemBuilder: (BuildContext context) => List.generate(modal.controller.filterList.length, (index) =>

          PopupMenuItem(
            value: modal.controller.filterList[index],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColor.greyLight,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: modal.controller.getSelectedFilter==modal.controller.filterList[index]?
                    AppColor.primaryColor:
                    Colors.white
                    ,
                  ),
                ),
                const SizedBox(width: 5,),
                Text(modal.controller.filterList[index].toString()),
              ],
            ),
          )
      ),
    );
  }



  Widget sortingButton(){
    return PopupMenuButton(
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(image: AssetImage('assets/sort.png'),
          height: 25,),
      ),
      onSelected: (result) {
        modal.controller.updateSelectedSort=int.parse(result.toString());
      },
      itemBuilder: (BuildContext context) => List.generate(modal.controller.sortingList.length, (index) =>

          PopupMenuItem(
            value: modal.controller.sortingList[index]['id'],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColor.greyLight,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: modal.controller.getSelectedSort==modal.controller.sortingList[index]['id']?
                    AppColor.primaryColor:
                        Colors.white
                    ,
                  ),
                ),
                const SizedBox(width: 5,),
                Text(modal.controller.sortingList[index]['title'].toString()),
              ],
            ),
          )
      ),
    );
  }


}
