import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:note/models/message.dart';
import 'package:note/validator/Validasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Msg> messages = [];
  Validasi validasi=new Validasi();
  final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
  TextEditingController Cjudul = new TextEditingController();
  TextEditingController Cisi = new TextEditingController();
  String id = "";


  Future _getDataUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      id = sharedPreferences.getString("id");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldState,
      appBar: new AppBar(
        title: Text('Isi Note'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                    controller: Cjudul,
                    decoration: new InputDecoration(
                        hintText: "Masukan title note",
                        labelText: "Title",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    maxLines: 15,
                    controller: Cisi,
                    decoration: new InputDecoration(
                        hintText: "Masukan content note",
                        labelText: "Content",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Add Data",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: () {
                    //validasi.
                    validasi.validasi_addDataNote(context, Cjudul.text, Cisi.text, id);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void initState() {


    super.initState();
    _getDataUser();
  }

  void showSnakeBar(scaffoldState, String _pesan) {
    scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: Text(_pesan),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
  }

}
