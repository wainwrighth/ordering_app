import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

final tab = new TabBar(tabs: <Tab>[
  new Tab(icon: new Icon(Icons.arrow_forward)),
  new Tab(icon: new Icon(Icons.arrow_downward)),
  new Tab(icon: new Icon(Icons.arrow_back)),
]);

class _OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                    color: Colors.grey.withOpacity(.1),
                    width: 4.0,
                    style: BorderStyle.solid
                ),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(child: Container(),),
                  TabBar(
                    tabs: [
                      Container(padding: EdgeInsets.only(bottom:10),child: Text("Past Orders")),
                      Container(padding: EdgeInsets.only(bottom:10),child: Text("Upcoming")),
                    ],
                    indicatorColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
        children: [
          Center(
            child: Container(
              height: 150,
              width: 90,
              child: Stack(
                children: [
                  Positioned(
                    left: 5,
                    child: Icon(Icons.receipt, size: 75, color: Colors.grey,),
                  ),
                  Positioned(
                    top: 85,
                    child: Text("No Orders Yet"),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 150,
              width: 130,
              child: Stack(
                children: [
                  Positioned(
                    left: 27,
                    child: Icon(Icons.receipt, size: 75, color: Colors.grey,),
                  ),
                  Positioned(
                    top: 85,
                    child: Text("No Upcoming Orders"),
                  ),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}