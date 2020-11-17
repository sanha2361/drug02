import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../datatable/PxTable.dart';
import '../home/drawermake.dart';
import '../models/user.dart';

class PatientDetail extends StatefulWidget {
  DocumentSnapshot ds;
  PatientDetail(this.ds);
  @override
  _DrugWriteState createState() => _DrugWriteState();
}

class _DrugWriteState extends State<PatientDetail> {
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  final textEditingController1 = TextEditingController();
  final textEditingController2 = TextEditingController();
  final textEditingController3 = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    textEditingController.text = widget.ds['room'];
    textEditingController1.text = widget.ds['name'];
    textEditingController2.text = widget.ds['diseasename'];
    textEditingController3.text = widget.ds['content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void UpdateDrug() async {
      Firestore.instance
          .collection('patient')
          .document(user.uid)
          .collection('patient')
          .document(widget.ds['dcid'])
          .updateData({
        'room': textEditingController.text ?? '',
        'name': textEditingController1.text ?? '',
        'disaesename': textEditingController2.text ?? '',
        'content': textEditingController3.text ?? '',
      });
      Navigator.pop(context);
    }

    void DeleteDrug() async {
      Firestore.instance
          .collection('patient')
          .document(user.uid)
          .collection('patient')
          .document(widget.ds['dcid'])
          .delete();
      Navigator.pop(context);
    }

    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(
        title: Text('Patient Detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text('병실'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(widget.ds['room'], style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 100.0,
                    ),
                    Text('이름'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(widget.ds['name'], style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 10.0,
                    ),
                    //FlatButton(color:Colors.blue,child:Text('수정'),onPressed: (){})
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text('병명'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(widget.ds['diseasename'],
                        style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 70.0,
                    ),
                    //FlatButton(color:Colors.blue,child:Text('수정'),onPressed: (){})
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text('경과'),
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(widget.ds['content'], style: TextStyle(fontSize: 17)),
                    //RaisedButton(color:Colors.blue,child:Text('수정'),onPressed: (){})
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('약처방'),
                Divider(
                  thickness: 7.0,
                ),
                PxTable(),
                SizedBox(
                  height: 10.0,
                ),
                Text('주사처방'),
                PxTable(),
                /*Row(children: <Widget>[
                    SizedBox(
                      width:100,height:30,
                      child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      onPressed: () {
                        showDialog(context: context,
                          builder:(BuildContext context){
                            return Prescription();
                          });
                      }
                     ),
                    ),
                  SizedBox(width:5),
                  SizedBox(
                      width:100,height:30,
                      child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      onPressed: () {DeleteDrug();
                      }
                    ),
                  ),
                  SizedBox(width:5),
                  SizedBox(
                      width:100,height:30,
                      child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                      onPressed: () { Navigator.pop(context);
                      }
                    ),
                  ),
                  ],),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
