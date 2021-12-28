
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:astro_tak/AppManager/alert_dialogue.dart';


import 'app_util.dart';


class RawApi{


  api(url,body,context,{
    bool? token,
  })
  async {
    print(baseUrl+url);
    print(body.toString());

    try{
      //Map<String, String> headerC;
      // var formData = FormData.fromMap(body);
      var response = (token??   false)?  await Dio().post(baseUrl+url,
        data: body,
        options: Options(
            headers: {
              'accessToken':  user.getUserToken,
              'userID': user.getUserId.toString(),
            }
        ),
      ):
      await Dio().post(baseUrl+url,
        data: body,
        options: Options(

        ),
      );
      var data = await jsonDecode(response.toString());


      if(data is String){
        if(data=='You are logged out, please login again !!' || data=='Unauthorised User'){
          Navigator.popUntil(context, ModalRoute.withName('/DashboardView'));
          await user.removeUserData();
        //  App().replaceNavigate(context, const LoginPageView());
          alertToast(context, data.toString());

        }
        else{
          var newData={
            'status': 0,
            'message': data,
          };
          print(newData.toString());
          return newData;
        }

        // return newData;
      }
      else{
        data['responseCode']=response.statusCode;
        print(data.toString());
        if(data['status']==0 && (data['message']=='Invalid Token' || data['message']=='Unauthorised User') ){
          Navigator.popUntil(context, ModalRoute.withName('/DashboardView'));
          await user.removeUserData();
        //  App().replaceNavigate(context, const LoginPageView());
          alertToast(context, data['message']);
        }
        else{
          print('dddddddddddd');
          return data;
        }



      }
    }
    on SocketException {
      print('No Internet connection');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Internet connection issue, try to reconnect.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
    on TimeoutException catch (e) {
      print('Time Out '+e.toString());
      var retry=await apiDialogue(context, 'Alert  !!!', 'Time Out, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
    catch (e) {
      print('Error in Api: $e');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Some Error Occur, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token,);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
  }

}
