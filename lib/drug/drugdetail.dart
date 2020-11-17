import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/drawermake.dart';
import '../models/user.dart';

class DrugDetail extends StatefulWidget {
  DocumentSnapshot ds;
  DrugDetail(this.ds);
  @override
  _DrugWriteState createState() => _DrugWriteState();
}

class _DrugWriteState extends State<DrugDetail> {
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  final textEditingController1 = TextEditingController();
  final textEditingController2 = TextEditingController();
  final textEditingController3 = TextEditingController();
  final textEditingController4 = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    textEditingController.text = widget.ds['system'];
    textEditingController1.text = widget.ds['disease'];
    textEditingController2.text = widget.ds['drugtype'];
    textEditingController3.text = widget.ds['drugname'];
    textEditingController4.text = widget.ds['content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    bool loading = false;
    void UpdateDrug() async {
      Firestore.instance
          .collection(user.uid)
          .document('drug')
          .collection(user.uid)
          .document(widget.ds['dcid'])
          .updateData({
        'system': textEditingController.text ?? '',
        'disease': textEditingController1.text ?? '',
        'drugtype': textEditingController2.text ?? '',
        'drugname': textEditingController3.text ?? '',
        'content': textEditingController4.text ?? '',
      });
      Navigator.pop(context);
    }

    void DeleteDrug() async {
      Firestore.instance
          .collection(user.uid)
          .document('drug')
          .collection(user.uid)
          .document(widget.ds['dcid'])
          .delete();
      Navigator.pop(context);
    }

    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(title: Text('Drug Update')),
      body: SingleChildScrollView(
        child: Container(
          //color:Colors.grey,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text('system', style: TextStyle(fontSize: 17)),
                TextFormField(
                    //widgetinitialValue:widget.ds['system'],
                    //decoration: textInputDecoration,
                    //validator: (val) => val.isEmpty ? 'Enter an email': null,
                    controller: textEditingController),
                SizedBox(
                  height: 10.0,
                ),
                Text('disease', style: TextStyle(fontSize: 17)),
                TextFormField(
                    // initialValue:widget.ds['disease'],
                    //decoration: textInputDecoration,
                    //obscureText:true,
                    //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                    controller: textEditingController1),
                SizedBox(
                  height: 10.0,
                ),
                Text('drugtype', style: TextStyle(fontSize: 17)),
                TextFormField(
                    //initialValue:widget.ds['drugtype'],
                    //decoration: textInputDecoration,
                    //obscureText:true,
                    //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                    controller: textEditingController2),
                SizedBox(
                  height: 10.0,
                ),
                Text('drugname', style: TextStyle(fontSize: 17)),
                TextFormField(
                    //initialValue:widget.ds['drugname'],
                    //decoration: textInputDecoration,
                    //obscureText:true,
                    //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                    controller: textEditingController3),
                SizedBox(
                  height: 10.0,
                ),
                Text('content', style: TextStyle(fontSize: 17)),
                TextFormField(
                    minLines: 3,
                    maxLines: null,
                    // initialValue:widget.ds['system'],
                    //decoration: textInputDecoration,
                    //obscureText:true,
                    //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                    controller: textEditingController4),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          onPressed: () {
                            UpdateDrug();
                          }),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          onPressed: () {
                            DeleteDrug();
                          }),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
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
