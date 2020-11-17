import 'package:flutter/material.dart';

import 'orderlist.dart';

class Prescription extends StatefulWidget {
  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();

    Future<Null> selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: DateTime(2019),
          lastDate: DateTime(2050));
      if (picked != null && picked != _date) {
        setState(() {
          _date = picked;
          print(_date.toString());
        });
      }
    }

    return SingleChildScrollView(
      child: AlertDialog(
        title: Column(
          children: <Widget>[
            Text(
              '처방',
            )
          ],
        ),
        content: OrderList(),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                selectDate(context);
              },
              child: Text('날짜')),
          FlatButton(
              onPressed: () {
                selectDate(context);
              },
              child: Text('처방')),
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'))
        ],
      ),
    );
  }
}
