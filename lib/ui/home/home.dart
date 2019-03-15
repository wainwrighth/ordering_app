import 'package:flutter/material.dart';

import 'package:ordering_app/ui/account.dart';
import 'package:ordering_app/ui/order.dart';
import 'package:ordering_app/ui/menu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1; // Default page to show on start
  final _widgetOptions = [ // Put all widget pages in here
    MenuPage(),
    OrderPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30,), title: Text('Home', style: TextStyle(fontSize: 0),)),
          BottomNavigationBarItem(icon: Icon(Icons.receipt, size: 30,), title: Text('Your Order', style: TextStyle(fontSize: 0),)),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 30,), title: Text('Account', style: TextStyle(fontSize: 0),)),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}