import 'package:flutter/material.dart';
import 'package:foodzy/data/data.dart';
import 'package:foodzy/screens/cartScreen.dart';
import 'package:foodzy/screens/restaurantScreen.dart';
import 'package:foodzy/widgets/ratings.dart';
import 'package:foodzy/widgets/recentOrders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    for (int i = 0; i < restaurants.length; i++) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => RestaurantScreen(
                          restaurant: restaurants[i],
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  // image
                  Container(
                    child: ClipRRect(
                      child: Hero(
                        tag: restaurants[i].imageUrl,
                        child: Image.asset(
                          restaurants[i].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 150,
                    height: 150,
                  ),

                  // column>restaurant name and all
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name of restaurent
                          Text(
                            restaurants[i].name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          // rating
                          Rating(restaurants[i].rating),
                          SizedBox(
                            height: 5,
                          ),
                          //address
                          Text(
                            restaurants[i].address,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          //distance
                          Text(
                            "1.2 km away",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FoodZ',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (comtext) => CartScreen()));
              },
              child: Text("Cart (5)",
                  style: TextStyle(color: Colors.white, fontSize: 20)))
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 1)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: Icon(Icons.clear, size: 30),
                hintText: "Search Food or Restaurant"),
          ),
        ),
        RecentOrders(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Nearby Restaurants",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    letterSpacing: 1.2),
              ),
            ),
            _buildRestaurants(),
          ],
        )
      ]),
    );
  }
}
