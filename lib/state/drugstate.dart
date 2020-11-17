import 'package:flutter/material.dart';

class DrugState extends ChangeNotifier{
  String drugname;

  void setDrugname(String name){
    drugname=name;
  }

  Future<String> get Drugname async  => drugname;
}