import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../home/drawermake.dart';
import '../models/user.dart';

import 'patientlist.dart';
import 'patientwrite.dart';

class Patient extends StatefulWidget {
  @override
  _DrugState createState() => _DrugState();
}

class _DrugState extends State<Patient> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(
        title: Text('환자'),
        actions: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text('환자등록',
                style: TextStyle(color: Colors.white, fontSize: 17)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientWrite()),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                // Text('user: '),
                Text(user.uid),
                SizedBox(width: 15),
                //TextField(),
                /* RaisedButton(
                         child:Text('search'),
                         onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>DrugWrite()),),
                         ),*/
              ]),
            ),
            /*Row(
                   children:<Widget>[
                    // Text('user: '),
                     TextField(),
                     RaisedButton(
                       child:Text('search'),
                       onPressed: (){},)
                     ]
                 ),*/
            Container(
                height: 50,
                color: Colors.amber,
                child: Row(
                  children: <Widget>[Text('fh')],
                )),
            TextField(),
            Divider(thickness: 5.0),
            Container(
              child: PatientList(),
            ),
          ],
        ),
      ),
    );
  }
}
