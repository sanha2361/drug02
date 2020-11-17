import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../state/drugstate.dart';

class ProviderTest extends StatefulWidget {
  @override
  _ProviderTestState createState() => _ProviderTestState();
}

class _ProviderTestState extends State<ProviderTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
        //child:Text('fdjfdfl'),
        child: Consumer<DrugState>(builder: (context, state, child) {
      return Text('${state.drugname}');
    })));
  }
}
