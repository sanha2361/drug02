import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../home/drawermake.dart';
import '../models/user.dart';

class MemoWrite extends StatefulWidget {
  @override
  _MemoWriteState createState() => _MemoWriteState();
}

class _MemoWriteState extends State<MemoWrite> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String subject = '';

  String content = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    void writeMemo(String subject, String content) async {
      final DocumentReference documentReference = await Firestore.instance
          .collection(user.uid)
          .document('memo')
          .collection(user.uid)
          .add({
        'dcid': "",
      });
      final String dcid = documentReference.documentID;
      print(dcid);
      Firestore.instance
          .collection(user.uid)
          .document('memo')
          .collection(user.uid)
          .document(dcid)
          .setData({
        'dcid': dcid ?? '',
        'subject': subject ?? '',
        'content': content ?? '',
      });
      Navigator.pop(context);
    }

    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(title: Text('Memo Write')),
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
                Text('subject', style: TextStyle(fontSize: 18)),
                TextFormField(
                  //decoration: textInputDecoration,
                  //validator: (val) => val.isEmpty ? 'Enter an email': null,
                  onChanged: (val) {
                    setState(() => subject = val);
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
                          writeMemo(subject, content);
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
