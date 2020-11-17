import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'pxdetail.dart';

class PxTileTable extends StatefulWidget {
  List<dynamic> dc;
  PxTileTable(this.dc);

  @override
  _PxTileTableState createState() => _PxTileTableState();
}

class _PxTileTableState extends State<PxTileTable> {
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
              label: Text('system', style: TextStyle(fontSize: 18)),
              numeric: false,
              onSort: (i, b) {
                print("$i $b");
                setState(() {
                  widget.dc.sort((a, b) => a['system'].compareTo(b['system']));
                });
              },
              tooltip: "To display drugtype of the Drug",
            ),
            DataColumn(
              label: Text('disease', style: TextStyle(fontSize: 18)),
              numeric: false,
              onSort: (i, b) {
                print("$i $b");
                setState(() {
                  widget.dc
                      .sort((a, b) => a['disease'].compareTo(b['disease']));
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
                        Text(name['system'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false,
                        placeholder: false, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PxDetail(name)),
                      );
                    }),
                    DataCell(
                        Text(name['disease'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false,
                        placeholder: false, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PxDetail(name)),
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
