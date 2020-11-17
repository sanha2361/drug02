import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:provider/provider.dart';
import '../datatable/PxTable.dart';
import '../dialogs/presciption.dart';
import '../home/drawermake.dart';
import '../models/user.dart';

class PatientWrite extends StatefulWidget {
  @override
  _DrugWriteState createState() => _DrugWriteState();
}

class _DrugWriteState extends State<PatientWrite> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String room = '';
  String name = '';
  String diseasename = '';
  String content = '';
  DateTime _date = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    void writeDrug(
        String room, String name, String diseasename, String content) async {
      final DocumentReference documentReference = await Firestore.instance
          .collection(user.uid)
          .document('patient')
          .collection(user.uid)
          .add({
        'dcid': "",
      });
      final String dcid = documentReference.documentID;
      print(dcid);
      Firestore.instance
          .collection(user.uid)
          .document('patient')
          .collection(user.uid)
          .document(dcid)
          .setData({
        'dcid': dcid ?? '',
        'room': room ?? '',
        'name': name ?? '',
        'diseasename': diseasename ?? '',
        'content': content ?? '',
      });
      Navigator.pop(context);
    }

    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(title: Text('Patient Write')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text('room', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //validator: (val) => val.isEmpty ? 'Enter an email': null,
                  onChanged: (val) {
                    setState(() => room = val);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('name', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //obscureText:true,
                  //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('diseasename', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //obscureText:true,
                  //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                  onChanged: (val) {
                    setState(() => diseasename = val);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('content', style: TextStyle(fontSize: 18)),
                TextFormField(
                  minLines: 3, maxLines: null,
                  //decoration: textInputDecoration,
                  //obscureText:true,
                  //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                  onChanged: (val) {
                    setState(() => content = val);
                  },
                ),
                Row(
                  children: <Widget>[
                    Text(_date.toString()),
                    RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          '처방',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Prescription();
                              });
                          //selectDate(context);
                        }),
                  ],
                ),
                PxTable(),
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 70.0,
                    ),
                    RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          writeDrug(room, name, diseasename, content);
                        }),
                    SizedBox(
                      width: 70.0,
                    ),
                    RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
