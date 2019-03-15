import 'package:flutter/material.dart';
import 'dart:convert';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List<Widget> foodIcons = [
    Image.asset("assets/food_icons/burger.png"),
    Image.asset("assets/food_icons/pizza.png"),
    Image.asset("assets/food_icons/hotdog.png"),
    Image.asset("assets/food_icons/sub.png"),
    Image.asset("assets/food_icons/sushi.png"),
    Image.asset("assets/food_icons/taco.png"),
    Image.asset("assets/food_icons/rice.png"),
    Image.asset("assets/food_icons/gyro.png"),
    Image.asset("assets/food_icons/popcorn.png"),
    Image.asset("assets/food_icons/fries.png"),
    Image.asset("assets/food_icons/shake.png"),
    Image.asset("assets/food_icons/coffee.png"),
  ];

  List<String> foodNames = [
    "Burgers",
    "Pizza",
    "Hot Dogs",
    "Subs",
    "Sushi",
    "Tacos",
    "Chinese",
    "Greek",
    "Popcorn",
    "Fries",
    "Shakes",
    "Coffee"
  ];

  Future<List> restaurants;

  bool burgerFave = false;
  bool mexicanFave = false;

/*  Widget showRestaurants(){
    if
  }*/

  Future<List> getRestaurants() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/restaurants.json");
    List list = [];
    list.add(json.decode(data));
    return list[0]["restaurants"];
  }

  @override
  void initState() {
    super.initState();
    restaurants = getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(.1),
        child: ListView(
          children: [
            Stack(
              children:[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12),
                    ),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: -3,
                  left: 5,
                  right: 5,
                  child: Row(
                    children:[
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.only(right: 15),
                          child: FlatButton(
                            onPressed: () => print("Location"),
                            child: Row(
                              children:[
                                Text("ASAP ", overflow: TextOverflow.ellipsis, maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                Icon(Icons.arrow_forward, size: 12,),
                                Text(" Location", overflow: TextOverflow.ellipsis, maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                Icon(Icons.arrow_drop_down, size: 14,),
                                ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                            onPressed: () => print("Filter"),
                            child: Text("Filter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children:[
                Container(
                  height: 275,
                  margin: EdgeInsets.only(top: 5),
                  color: Colors.white,
                ),
                Column(
                  children: [
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("Popular Near You", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 220,
                      child: FutureBuilder(
                        future: restaurants,
                        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                          if(snapshot.hasData) {
                            List content = snapshot.data;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: content.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children:[
                                    SizedBox(width: 20,),
                                    Stack(
                                    children: [
                                      Container(
                                        width: 300,
                                        height: 210,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(3)),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 2,
                                              color: Colors.black.withOpacity(.05),
                                              spreadRadius: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            width: 290,
                                            height: 125,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(content[index]["image"]), fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: IconButton(onPressed: () {setState((){if(content[index]["fave"]){content[index]["fave"] = false;}else{content[index]["fave"] = true;}});}, icon: (content[index]["fave"] ? Icon(Icons.favorite, color: Colors.white,) : Icon(Icons.favorite_border, color: Colors.white,)), padding: EdgeInsets.only(left: 250, bottom: 90),),
                                          ),
                                          Container(
                                            width: 290 ,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children:[
                                                    Text(content[index]["restaurant"] + " (" + content[index]["location"] + ")",),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Row(
                                                  children: [
                                                    Text(content[index]["info"], style: TextStyle(color: Colors.grey),),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: 75,
                                                      color: Colors.grey[200],
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(content[0]["delivery_time"]),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    Container(
                                                      height: 20,
                                                      width: 75,
                                                      color: Colors.grey[200],
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(content[0]["rating"]),
                                                          Icon(Icons.star, color: Colors.amber, size: 14,),
                                                          Text("(" + content[0]["rating_count"] + ")"),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    Container(
                                                      height: 20,
                                                      width: 75,
                                                      color: Colors.grey[200],
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(content[0]["fee"] + " Fee"),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}