import 'package:flutter/material.dart';
import 'package:note/ui/splassScreen.dart';



void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note',
      debugShowCheckedModeBanner: false,
      home: SplassScreen(),
    );
  }
}

//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//void main() => runApp(new MaterialApp(home: new MyApp()));
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//  @override
//  void initState() {
//    super.initState();
//    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//    var androidd = new AndroidInitializationSettings('@mipmap/ic_launcher');
//    var iOSs = new IOSInitializationSettings();
//    var initSetttings = new InitializationSettings(android: androidd,iOS: iOSs);
//    flutterLocalNotificationsPlugin.initialize(initSetttings, onSelectNotification: onSelectNotification);
//
//  }
//
//  Future onSelectNotification(String payload) {
//    debugPrint("payload : $payload");
//    showDialog(
//      context: context,
//      builder: (_) => new AlertDialog(
//        title: new Text('Notification'),
//        content: new Text('$payload'),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: new AppBar(
//        title: new Text('Flutter Local Notification'),
//      ),
//      body: new Center(
//        child: new RaisedButton(
//          onPressed: showNotification,
//          child: new Text(
//            'Demo',
//            style: Theme.of(context).textTheme.headline,
//          ),
//        ),
//      ),
//    );
//  }
//
//  showNotification() async {
//    var android = new AndroidNotificationDetails('channel id', 'channel NAME', 'CHANNEL DESCRIPTION', priority: Priority.high,importance: Importance.max);
//    var iOS = new IOSNotificationDetails();
//    var platform = new NotificationDetails(android: android,iOS: iOS);
//    await flutterLocalNotificationsPlugin.show(0, 'New Video is out', 'Flutter Local Notification', platform, payload: 'Nitish Kumar Singh is part time Youtuber');
//  }
//}