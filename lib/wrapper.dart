import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'models/user.dart';

import 'home/home.dart';
import 'login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user);
    //Loading();
    // return either the Home or Authenticate widget
    //return SignIn();

    if (user == null) {
      return LoginPage();
    } else {
      return Home();
    }
  }
}
