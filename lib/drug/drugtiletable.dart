import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'drugdetail.dart';

class DrugTileTable extends StatefulWidget {
  List<dynamic> dc;
  DrugTileTable(this.dc);

  @override
  _DrugTileTableState createState() => _DrugTileTableState();
}

class _DrugTileTableState extends State<DrugTileTable> {
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
              label: Text('drugtype', style: TextStyle(fontSize: 18)),
              numeric: false,
              onSort: (i, b) {
                print("$i $b");
                setState(() {
                  widget.dc
                      .sort((a, b) => a['drugtype'].compareTo(b['drugtype']));
                });
              },
              tooltip: "To display drugtype of the Drug",
            ),
            DataColumn(
              label: Text('drugname', style: TextStyle(fontSize: 18)),
              numeric: false,
              onSort: (i, b) {
                print("$i $b");
                setState(() {
                  widget.dc
                      .sort((a, b) => a['drugname'].compareTo(b['drugname']));
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
                    DataCell(
                        Text(name['drugtype'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false,
                        placeholder: false, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DrugDetail(name)),
                      );
                    }),
                    DataCell(
                        Text(name['drugname'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false,
                        placeholder: false, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DrugDetail(name)),
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
