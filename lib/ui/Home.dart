import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:note/database/Services.dart';
import 'package:note/models/message.dart';
import 'package:note/ui/AddData.dart';
import 'package:note/ui/AkunScreen.dart';
import 'package:note/ui/Detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final List<Msg> messages = [];
  Services services=new Services();
  String nama = "";
  String email = "";
  String telp = "";
  String jk = "";
  String id = "";

  Future<List> getData() async {
    final response = await http.post(
        "http://192.168.43.49/webservice_note/RestFullAPi",
        body: {"id": id});
    return json.decode(response.body);
  }

  Future _getDataUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      nama = sharedPreferences.getString("nama");
      telp = sharedPreferences.getString("telp");
      email = sharedPreferences.getString("email");
      jk = sharedPreferences.getString("jk");
      id = sharedPreferences.getString("id");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Home"),
          backgroundColor: Colors.blue,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AkunScreen()),
                );
              },
              child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.person_pin,
                    size: 30,
                  )),
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddData()));
            }),
        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {

            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }

  showNotification(String title,String body) async {
    var android = new AndroidNotificationDetails('channel id', 'channel NAME', 'CHANNEL DESCRIPTION', priority: Priority.high,importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android,iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, '$title', '$body', platform, payload: 'Nitish Kumar Singh is part time Youtuber');
  }


  //inialisasi awal
  void initState() {

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Msg(
              title: notification['title'], body: notification['body']));
        });
        setState(() {
          showNotification(notification['title'], notification['body']);
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          messages.add(Msg(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    super.initState();

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var androidd = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSs = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: androidd,iOS: iOSs);
    flutterLocalNotificationsPlugin.initialize(initSetttings, onSelectNotification: onSelectNotification);

    _getDataUser();
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Dismissible(
            key: new ObjectKey(list[i]['id'].toString()),
            onDismissed: (DismissDirection direction) {
              Services services=new Services();
              services.deleteData(context, list[i]['id']);
              list.remove(i);
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Data  berhasil dihapus"),
              ));
            },
            background: new Container(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.restore_from_trash,color: Colors.black,)),
              color: Colors.redAccent,
            ),
            child: new Container(
              child: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Detail(list: list, index: i)));
                },
                child: new Card(
                  color: Colors.white,
                  child: new ListTile(
                    title: new Text(list[i]['judul']),
                    leading: new Icon(Icons.list),
                  ),
                ),
              ),
            ),
          );
        });
  }


}
