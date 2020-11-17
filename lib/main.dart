import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'services/auth.dart';

import 'models/user.dart';
import 'wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //bool loading=false;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

//mutliprovider와 환자부분 개선해 보자
