import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pxwrite.dart';
import 'pxlist.dart';
import '../home/home.dart';
import '../home/drawermake.dart';
import '../models/user.dart';
//import 'pxlist.dart';
//import 'pxwrite.dart';

class Px extends StatefulWidget {
  @override
  _PxState createState() => _PxState();
}

class _PxState extends State<Px> {
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
        title: Text('처치'),
        actions: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text('처치등록',
                style: TextStyle(color: Colors.white, fontSize: 17)),
            onPressed: () => Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => Home()),
              MaterialPageRoute(builder: (context) => PxWrite()),
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
              child: PxList(),
            ),
          ],
        ),
      ),
    );
  }
}
