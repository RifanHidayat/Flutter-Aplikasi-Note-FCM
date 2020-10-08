import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note/ui/Home.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}
class _EditDataState extends State<EditData> {
  final GlobalKey<ScaffoldState> scaffoldState =
  new GlobalKey<ScaffoldState>();
  TextEditingController Cjudul;
  TextEditingController Cisi;
  TextEditingController gajiController;
  void editData() async {
    final responseData = await
    http.post("http://192.168.43.49/webservice_note/RestFullAPi/editNote",
        body: {
      "id": widget.list[widget.index]['id'], "judul": Cjudul.text, "isi": Cisi.text}
    );

    final data = jsonDecode(responseData.body);
    var status=data['status'];
    var pesan=data['message'];
    if (status=="true"){
      Navigator.of(context).push(new
      MaterialPageRoute(builder: (BuildContext context) => new Home()));

    }else{

      showSnakeBar(scaffoldState,
          '$pesan');
    }
  }

  @override
  void initState() {




    Cjudul= new TextEditingController(text:
    widget.list[widget.index]['judul']);
    Cisi = new TextEditingController(text:
    widget.list[widget.index]['isi']);
    super.initState();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldState,
        appBar: new AppBar(
        title: Text('Ubah Note'),
    backgroundColor: Colors.blue,
    ),
    body: Padding(
    padding: const EdgeInsets.all(10.0),
    child: ListView(children: <Widget>[
    new Column(
    children: <Widget>[
    new Padding(padding: new EdgeInsets.only(top: 15.0)),
    new TextField(
    controller: Cjudul,
    decoration: new InputDecoration(
    hintText: "Input tiitle note",
    labelText: "Tiitle",
    border: new OutlineInputBorder(
    borderRadius: new BorderRadius.circular(20.0)
    )
    ),
    ),
    new Padding(padding: new EdgeInsets.only(top: 15.0)),
    new TextField(
      maxLines: 15,
    controller: Cisi,decoration: new InputDecoration(
        hintText: "Masukan content note",
        labelText: "Content",
        border: new OutlineInputBorder(
            borderRadius: new
            BorderRadius.circular(20.0))),
    ),
      new Padding(padding: new EdgeInsets.only(top: 15.0)),

      new Padding(padding: new EdgeInsets.only(top: 15.0)),
      new RaisedButton(
        child: new Text(' Edit Data',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blueAccent,
        onPressed: (){
          editData();

        },
      )
    ],
    )
    ],),
    ),
    );
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
