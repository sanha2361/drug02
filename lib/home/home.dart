import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import '../models/user.dart';
import 'drawermake.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String drugname = 'gkhk';
  @override
  void initState() {
    /* print(Drug().druglist.where((e) =>e['system']=='circ'));
    print(Drug().druglist.map((e) =>e['system']=='circ'));
    print(Drug().druglist.where((e) =>e['system']=='circ').map((e) => e['disease']));
    print(Drug().druglist.where((e) =>e['system']=='circ').map((e) => e['disease'][0]));
    print(Drug().druglist.where((e) =>e['system']=='circ').map((e) => e['disease'][0]['dsname']));
    print(Drug().druglist.where((e) =>e['system']=='circ').map((e) => e['disease'][0]['drugtype']));
    print(Drug().druglist.where((e) =>e['system']=='circ').map((e) => e['disease'][0]['drugtype'][0]));*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool pch = false;
    final user = Provider.of<User>(context);
    if (user.uid == 'NpdwVi8Z3qXUAM1HKRU6ujvFAYl2') pch = true;
    return Scaffold(
      drawer: DrawerMake(),
      appBar: AppBar(
        title: Text('Drug2'),
        actions: <Widget>[
          //pch == false
          //    ? FlatButton(onPressed: null, child: null)
          //    : FlatButton(
          //       child: Text('write', style: TextStyle(color: Colors.white)),
          //        onPressed: () {
          //Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeWrite()),);
          //        })
          InkWell(
            child: CircleAvatar(
                backgroundImage: (user.photoUrl == null)
                    ? NetworkImage('https://picsum.photos/250?image=9')
                    : NetworkImage(user.photoUrl)),
            onTap: () async {
              print("힘내라");
              await AuthService().signOut();
              //Navigator.pushNamed(context, '/profile', arguments: user);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // height:100,
              color: Colors.amber,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[Text('dff')],
                  )
                ],
              ),
            ),
            Container(
              width: 430,
              //color:Colors.blue,
              //child: HomeList(),
            ),
            SizedBox(height: 20),
            Container(
              //height:100,
              color: Colors.amber,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[Text('dff')],
                  )
                ],
              ),
            ),

            /*Container(
                  width:430,
                  color:Colors.blue,
                  child: HomeList(),
                 ),
                  Container(
                    color:Colors.amber,
                    child:Text('jjkkk'),
                  
                ),
                Container(
                  width:430,color:Colors.amber,
                   child: HomeList(),
                )*/
          ],
        ),
      ),
    );
  }
}
