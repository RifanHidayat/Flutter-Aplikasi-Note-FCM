import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note/SharedPreferenced/SessionManager.dart';
import 'package:note/ui/Home.dart';
import 'package:note/ui/Login.dart';
import 'package:toast/toast.dart';

class Services{
  SharedPreference session=new SharedPreference();
  Future<void> register(BuildContext context,String nama, String email, String telp, String password,
      String jk) async {
    proses(context);
    final responseData = await http.post(
        "http://192.168.43.49/webservice_note/RestFullAPi/register",
        body: {
          "nama": nama,
          "email": email,
          "telp": telp,
          "pass": password,
          "jk": jk
        });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if (value == 1) {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => new LoginScreen()));

      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);

    } else if (value == 0) {
      Navigator.pop(context);
      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);
    }
    if (value == 2) {
      Navigator.pop(context);
      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);
    } else {
      Navigator.pop(context);
      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);
    }
  }

  Future<void> login(BuildContext context,String email,String password) async {

    proses(context);
    final responseData = await
    http.post("http://192.168.43.49/webservice_note/RestFullAPi/login", body: {
      "email": email,
      "pass": password,
    });

    final data = jsonDecode(responseData.body);

    int value = data['value'];
    String pesan = data['message'];
    print(data);
// get data respon
    String dataId = data['detail']['id'];
    String dataNama = data['detail']['nama'];
    String dataTelp = data['detail']['email'];
    String dataEmail = data['detail']['email'];
    String datajk = data['detail']['jk'];

// cek value 1 atau 0
    if (value == 1) {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => new Home()));

      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);
      session.saveDataPref(value,dataId, dataNama, dataTelp,dataEmail,datajk);

    } else if (value == 0) {
      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);
    }
  }

  Future <void> addData(BuildContext context,String judul,String isi,String id) async {
    proses(context);
    final responseData = await http.post(
        "http://192.168.43.49/webservice_note/RestFullAPi/addNote",
        body: {"judul": judul, "isi": isi, "id": id});

    final data = jsonDecode(responseData.body);
    var status = data['status'];
    var pesan = data['message'];
    if (status == "true") {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home()),
        ModalRoute.withName('/AddData'),
      );
      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);
      sendNotification("Data baru ditambahkan", "Notif");
    } else {
      Navigator.pop(context);
      Toast.show("$pesan", context,
          duration: 5, gravity: Toast.BOTTOM);
    }
  }
  Future<void> deleteData(BuildContext context, String id) async {
    final responseData = await
    http.post("http://192.168.43.49/webservice_note/RestFullAPi/deleteNote",
        body: {'id':id}
    );
    final data = jsonDecode(responseData.body);
    var status=data['status'];
    var pesan=data['message'];
    if (status=="true"){

    }
  }


  void proses(BuildContext context) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(

              content:Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Loading...."),
                    SizedBox(height: 30,),
                    CircularProgressIndicator(

                      backgroundColor: Colors.blue[250],

                    ),
                  ],
                ),



              )

          );

        }
    );
  }
  @override
  Future<void> sendNotification(String body, String title) async{
    String to = await  FirebaseMessaging().getToken();
    String serverToken='AAAAjbJE_Dc:APA91bEfBOeAFzbarsjSUuAp30n1i9b6KWxciMgKBHrAbExg-5c_GKePJGs4iZURT5579H_T2VGVJd9CgKb4Z5Wt6qIah1XhlVQz6S8f3jst-Aa18CP5sH_I6Rmh2_SdmCvUru92ni6T';
    await http.post('https://fcm.googleapis.com/fcm/send',
        headers: {
          'Content-Type':'application/json',
          'Authorization':'key=$serverToken'
        },
        body:jsonEncode({
          'notification':{
            'title':title,
            'body':body
          },
          'priority':'high',
          'data':{
            'click_action':'FLUTTER_NOTIFICATION_CLICK'
          },
          'to':'$to'
        })
    );
  }
}