import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(.1),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            GestureDetector(
            onTap: () => print("settings"),
            child: Stack(
              children:[
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12),
                    ),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 12.5,
                  left: 15,
                  right: 15,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [Colors.white, Colors.grey.withOpacity(.7)],
                            radius: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person, color: Colors.grey, size: 30),
                      ),
                      SizedBox(width: 25,),
                      Text("Account Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    leading: Icon(Icons.favorite_border, color: Colors.black,),
                    title: Text("Your Favorites"),
                    onTap: () => print("favorites"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    leading: Icon(Icons.credit_card, color: Colors.black,),
                    title: Text("Payment"),
                    onTap: () => print("payment"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    leading: Icon(Icons.help_outline, color: Colors.black,),
                    title: Text("Help"),
                    onTap: () => print("help"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    leading: Icon(Icons.local_atm, color: Colors.black,),
                    title: Text("Promotions"),
                    onTap: () => print("promotions"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    leading: Icon(Icons.card_giftcard, color: Colors.black,),
                    title: Text("Free Food"),
                    onTap: () => print("free"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    leading: Icon(Icons.directions_car, color: Colors.black,),
                    title: Text("Deliver with Us"),
                    onTap: () => print("deliver"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    leading: Icon(Icons.settings, color: Colors.black,),
                    title: Text("Settings"),
                    onTap: () => print("settings"),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => print("burger"),
              child: Stack(
                children:[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12),
                      ),
                      color: Colors.greenAccent.withOpacity(.2),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    right: 15,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/ubereat_burger.png"),
                        ),
                        SizedBox(width: 25,),
                        Text("Get \$5 off your order", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),),
                        SizedBox(width: 140,),
                        Icon(Icons.arrow_forward_ios, color: Colors.green, size: 16,),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
            onTap: () => print("about"),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 25),
                    title: Text("About"),
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