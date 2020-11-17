import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'memodetail.dart';

class MemoTileTable extends StatefulWidget {
  List<dynamic> dc;
  MemoTileTable(this.dc);

  @override
  _MemoTileTableState createState() => _MemoTileTableState();
}

class _MemoTileTableState extends State<MemoTileTable> {
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
              label: Text('제목', style: TextStyle(fontSize: 18)),
              numeric: false,
              onSort: (i, b) {
                print("$i $b");
                setState(() {
                  widget.dc
                      .sort((a, b) => a['subject'].compareTo(b['subject']));
                });
              },
              tooltip: "To display drugtype of the Drug",
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
                        Text(name['subject'], style: TextStyle(fontSize: 17)),
                        showEditIcon: false,
                        placeholder: false, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemoDetail(name)),
                      );
                    }),
                  ],
                ),
              )
              .toList()),
    );
  }
}
