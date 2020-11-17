import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../home/drawermake.dart';
import '../models/user.dart';

class DrugWrite extends StatefulWidget {
  @override
  _DrugWriteState createState() => _DrugWriteState();
}

class _DrugWriteState extends State<DrugWrite> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String system = '';
  String disease = '';
  String drugtype = '';
  String drugname = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    void writeDrug(String system, String disease, String drugtype,
        String drugname, String content) async {
      final DocumentReference documentReference = await Firestore.instance
          .collection(user.uid)
          .document('drug')
          .collection(user.uid)
          .add({
        'dcid': "",
      });
      final String dcid = documentReference.documentID;
      print(dcid);
      Firestore.instance
          .collection(user.uid)
          .document('drug')
          .collection(user.uid)
          .document(dcid)
          .setData({
        'dcid': dcid ?? '',
        'system': system ?? '',
        'disease': disease ?? '',
        'drugtype': drugtype ?? '',
        'drugname': drugname ?? '',
        'content': content ?? '',
      });
      Navigator.pop(context);
    }

    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(title: Text('Drug Write')),
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
                Text('system', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //validator: (val) => val.isEmpty ? 'Enter an email': null,
                  onChanged: (val) {
                    setState(() => system = val);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('disease', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //obscureText:true,
                  //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                  onChanged: (val) {
                    setState(() => disease = val);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('drugtype', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //obscureText:true,
                  //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                  onChanged: (val) {
                    setState(() => drugtype = val);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('drugname', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //obscureText:true,
                  //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                  onChanged: (val) {
                    setState(() => drugname = val);
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
                          writeDrug(
                              system, disease, drugtype, drugname, content);
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
