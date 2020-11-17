import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providertest.dart';
import '../dialogs/presciption.dart';
import '../models/order.dart';
import '../state/drugstate.dart';

class PxTable extends StatefulWidget {
  @override
  _PxTableState createState() => _PxTableState();
}

class _PxTableState extends State<PxTable> {
  List<Order> orders;
  List<Order> selectorders;

  @override
  void initState() {
    orders = Order.getOrders();
    super.initState();
    selectorders = [];
  }

  @override
  Widget build(BuildContext context) {
    void providertest() {
      DrugState state = Provider.of<DrugState>(context);
      state.setDrugname('lasix');
      //print(state.drugname);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProviderTest()));
    }

    onSelectedRow(bool selected, Order order) async {
      setState(() {
        if (selected) {
          selectorders.add(order);
        } else {
          selectorders.remove(order);
        }
      });
    }

    deleteSelected() async {
      setState(() {
        if (selectorders.isNotEmpty) {
          List<Order> temp = [];
          temp.addAll(selectorders);
          for (Order user in temp) {
            orders.remove(user);
            selectorders.remove(user);
          }
        }
      });
    }

    return Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          DataTable(
              columns: [
                DataColumn(label: Text('약종류')),
                DataColumn(label: Text('약이름')),
                DataColumn(label: Text('')),
              ],
              rows: orders
                  .map((order) => DataRow(
                          //selected:false,
                          selected: selectorders.contains(order),
                          onSelectChanged: (b) {
                            onSelectedRow(b, order);
                          },
                          cells: [
                            DataCell(
                              Text(order.drugtype),
                              onTap: () {},
                            ),
                            DataCell(
                              Text(order.drugname),
                              onTap: () {},
                            ),
                            DataCell(
                              Text(''),
                              onTap: () {},
                            ),
                          ]))
                  .toList()),
          Divider(thickness: 5),
          Row(
            children: <Widget>[
              RaisedButton(
                  color: Colors.blue,
                  child: Text('test'),
                  onPressed: () {
                    providertest();
                  }),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('처방추가'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Prescription();
                        });
                  }),
              SizedBox(width: 50),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('처방삭제'),
                  onPressed: () {
                    deleteSelected();
                  }),
            ],
          ),
          Divider(thickness: 5),
        ]));
  }
}
