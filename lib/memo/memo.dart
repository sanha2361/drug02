import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'pxwrite.dart';
//import 'pxlist.dart';
import '../home/home.dart';
import '../home/drawermake.dart';
import '../models/user.dart';
import 'memolist.dart';
import 'memowrite.dart';
//import 'pxlist.dart';
//import 'pxwrite.dart';

class Memo extends StatefulWidget {
  @override
  _MemoState createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    bool loading = false;
    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(
        title: Text('메모'),
        actions: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text('메모등록',
                style: TextStyle(color: Colors.white, fontSize: 17)),
            onPressed: () => Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => Home()),
              MaterialPageRoute(builder: (context) => MemoWrite()),
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
            Divider(thickness: 5.0),
            Container(
              child: MemoList(),
            ),
          ],
        ),
      ),
    );
  }
}
