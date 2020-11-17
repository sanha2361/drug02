import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../memo/memo.dart';
import '../px/px.dart';
import '../services/auth.dart';
import '../drug/drug.dart';

import '../models/user.dart';
import '../patient/patient.dart';

import 'home.dart';

class DrawerMake extends StatefulWidget {
  @override
  _DrawerMakeState createState() => _DrawerMakeState();
}

class _DrawerMakeState extends State<DrawerMake> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(user.uid),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          Divider(thickness: 3.0),
          ListTile(
            title: Text('약', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Drug()),
              );
            },
          ),
          Divider(thickness: 3.0),
          ListTile(
            title: Text('환자', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Patient()),
              );
            },
          ),
          Divider(thickness: 3.0),
          ListTile(
            title: Text('처치', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Px()),
              );
            },
          ),
          Divider(thickness: 3.0),
          ListTile(
            title: Text('메모', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Memo()),
              );
            },
          ),
          Divider(thickness: 3.0),
          ListTile(
            //leading: Icon(Icons.arrow_back),
            title: Text("Logout", style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(''),
                      content: Text('종료하시겠습니까?'),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              await AuthService().signOut();
                              //SystemNavigator.pop();
                            },
                            child: Text('예')),
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('아니오'))
                      ],
                    );
                  });
              //AuthService().signOut();
              //Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()),);
              //Navigator.pop(context);
              //SystemNavigator.pop();
            },
          ),
        ],
      ),
      //child:DrawerListStream(user),
      //child:DrawerListView(),
    );
  }
}
