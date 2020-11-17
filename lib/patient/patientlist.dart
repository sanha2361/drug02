import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../shared/loading.dart';

import 'pateintiletable.dart';

class PatientList extends StatefulWidget {
  @override
  _DrugListState createState() => _DrugListState();
}

class _DrugListState extends State<PatientList> {
  List drug = ['hgg', 'jkkl'];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //String dcid;
    /*void collectionmake() async {
     final DocumentReference documentReference= await Firestore.instance.collection('drug').document(user.uid)
     .collection('drug').add({'user':user.uid});
    dcid=documentReference.documentID;
    print(dcid);}
    collectionmake();*/
    //String dcname=Firestore.instance.collection(user.uid).document().documentID;
    //print(dcname);
    return StreamBuilder(
        stream: Firestore.instance
            .collection(user.uid)
            .document('patient')
            .collection(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
            //print('no data');
          }

          List list = new List();
          for (DocumentSnapshot dc in snapshot.data.documents) {
            //print(dc['system']);print(dc['drugtype']);
            list.add(dc);
          }

          return PatientTileTable(list);
          /*return ListView.builder(
           itemCount: list.length,
           
           itemBuilder:(context,index){return DrugTile(list[index]);});
          */
        });
  }
}

/*class _DrugListState extends State<DrugList> {
  List drug=['hgg','jkkl'];
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemCount: drug.length,
      itemBuilder: (context, index) => Text(drug[index]),
    ));
  }
}*/
