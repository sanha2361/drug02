import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderTileTable extends StatefulWidget {
  List<dynamic> dc;
  OrderTileTable(this.dc);

  @override
  _DrugTileTableState createState() => _DrugTileTableState();
}

class _DrugTileTableState extends State<OrderTileTable> {
  List<dynamic> drugs;

  @override
  void initState() {
    drugs = [];
    super.initState();
  }

  onSelectedRow(bool selected, dynamic ds) async {
    setState(() {
      if (selected) {
        print(ds['drugtype']);
        drugs.add(ds);
      } else {
        print(ds['drugname']);
        drugs.remove(ds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      DataTable(
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
                  selected: drugs.contains(name),
                  onSelectChanged: (b) {
                    onSelectedRow(b, name);
                  },
                  cells: [
                    DataCell(
                        Text(name['drugtype'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false,
                        placeholder: false,
                        onTap: () {}),
                    DataCell(
                        Text(name['drugname'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false,
                        placeholder: false,
                        onTap: () {}

                        // print(name['drugtype']);}

                        ),
                  ],
                ),
              )
              .toList()),
      Row(children: <Widget>[
        FlatButton(
            onPressed: () {
              for (int i = 0; i < drugs.length; i++) {
                print(drugs.length);
                print(drugs[i]['drugtype']);
                print(drugs[i]['drugname']);
              }
            },
            child: Text('처방')),
      ]),
    ]));
  }
}
