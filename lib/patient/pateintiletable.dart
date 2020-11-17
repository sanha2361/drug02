import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'patientdetail.dart';

class PatientTileTable extends StatefulWidget {
  List<dynamic> dc;
  PatientTileTable(this.dc);

  @override
  _DrugTileTableState createState() => _DrugTileTableState();
}

class _DrugTileTableState extends State<PatientTileTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
          onSelectAll: (b) {},
          //sortColumnIndex: 0,
          sortAscending: true,
          columns: [
            /*DataColumn(label: Text('disease',style:TextStyle(fontSize:18)),
          numeric: false,
            onSort: (i, b) {
              print("$i $b");
              setState(() {
                widget.dc.sort((a, b) => a['disease'].compareTo(b['disease']));
              });
            },
            tooltip: "To display disease name of the Drug",
          ),*/
            DataColumn(
              label: Text('병실', style: TextStyle(fontSize: 18)),
              numeric: false,
              onSort: (i, b) {
                print("$i $b");
                setState(() {
                  widget.dc.sort((a, b) => a['room'].compareTo(b['room']));
                });
              },
              tooltip: "To display drugtype of the Drug",
            ),
            DataColumn(
              label: Text('이름', style: TextStyle(fontSize: 18)),
              numeric: false,
              onSort: (i, b) {
                print("$i $b");
                setState(() {
                  widget.dc.sort((a, b) => a['name'].compareTo(b['name']));
                });
              },
              tooltip: "To display drugname of the Drug",
            ),
            //DataColumn(label: Text('drugname')),
          ],
          rows: widget.dc
              .map(
                (name) => DataRow(
                  cells: [
                    /*DataCell(
                          Text(name['disease'],style:TextStyle(fontSize:17)),
                          showEditIcon: false,
                          placeholder: false,
                          onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>DrugDetail(name)),);}
                        ),*/
                    DataCell(Text(name['room'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false, placeholder: false, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientDetail(name)),
                      );
                    }),
                    DataCell(Text(name['name'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false, placeholder: false, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientDetail(name)),
                      );
                    }),
                    /*DataCell(
                          Text(name['drugname']),
                          showEditIcon: false,
                          placeholder: false,
                        )*/
                  ],
                ),
              )
              .toList()),
    );
  }
}
