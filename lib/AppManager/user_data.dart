
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';




class UserData extends GetxController {
  final userData = GetStorage('user');


  String get getUserToken => (userData.read('userToken')) ?? '';
  Map<String, dynamic> get getUserData => userData.read('userData') ?? {};


  String get getUserId => getUserData.isNotEmpty ? getUserData['userid'].toString():'';
  String get getUserName => getUserData.isNotEmpty ? getUserData['username'].toString():'';
  String get getDisplayName => getUserData.isNotEmpty ? getUserData['displayName'].toString():'';
  String get getDesignationId => getUserData.isNotEmpty ? getUserData['designationID'].toString():'';
  String get getDesigId => getUserData.isNotEmpty ? getUserData['desigid'].toString():'';
  String get getUserTypeId => getUserData.isNotEmpty ? getUserData['userTypeID'].toString():'';
  String get getIsMain => getUserData.isNotEmpty ? getUserData['isMain'].toString():'';
  String get getUserImage => '';





  addToken(String val) async{
    await userData.write('userToken', val);
    update();
  }

  addUserData(Map val) async {
    await userData.write('userData', val);
    update();
  }


  addHeadAssigned(List val) async {
    await userData.write('headAssigned', val);
    update();
  }

  removeUserData() async{
    await userData.remove('userData');
    await userData.remove('userToken');
    await userData.remove('headAssigned');
  }



}




