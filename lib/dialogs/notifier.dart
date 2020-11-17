import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../datatable/PxTable.dart';
import '../state/drugstate.dart';

class Notifier extends StatefulWidget {
  @override
  _NotifierState createState() => _NotifierState();
}

class _NotifierState extends State<Notifier> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DrugState(), child: PxTable());
  }
}
