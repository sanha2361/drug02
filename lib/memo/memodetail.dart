import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/drawermake.dart';
import '../models/user.dart';

class MemoDetail extends StatefulWidget {
  DocumentSnapshot ds;
  MemoDetail(this.ds);
  @override
  _MemoWriteState createState() => _MemoWriteState();
}

class _MemoWriteState extends State<MemoDetail> {
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  final textEditingController1 = TextEditingController();
  final textEditingController2 = TextEditingController();
  final textEditingController3 = TextEditingController();
  final textEditingController4 = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    textEditingController.text = widget.ds['subject'];
    //textEditingController1.text = widget.ds['disease'];

    textEditingController4.text = widget.ds['content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    bool loading = false;

    void UpdateMemo() async {
      Firestore.instance
          .collection(user.uid)
          .document('memo')
          .collection(user.uid)
          .document(widget.ds['dcid'])
          .updateData({
        'subject': textEditingController.text ?? '',
        //'disease': textEditingController1.text ?? '',
        'content': textEditingController4.text ?? '',
      });
      Navigator.pop(context);
    }

    void DeleteMemo() async {
      Firestore.instance
          .collection(user.uid)
          .document('memo')
          .collection(user.uid)
          .document(widget.ds['dcid'])
          .delete();
      Navigator.pop(context);
    }

    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(title: Text('Memo Update')),
      body: SingleChildScrollView(
        child: Container(
          //color:Colors.grey,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //SizedBox(
                //  height: 10.0,
                //),
                Text('subject:', style: TextStyle(fontSize: 17)),
                TextFormField(
                    minLines: 3,
                    maxLines: 4,
                    // initialValue:widget.ds['system'],
                    //decoration: textInputDecoration,
                    //obscureText:true,
                    //validator: (val) => val.length < 6 ? 'Enter an password >6': null,
                    controller: textEditingController),

                Text('content:', style: TextStyle(fontSize: 17)),
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
                            UpdateMemo();
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
                            DeleteMemo();
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
