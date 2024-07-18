
import 'package:flutter/material.dart';
import 'package:market_app/colors.dart';
import 'package:market_app/components/bottom_nav_bar.dart';
import 'package:market_app/components/coffee_tile.dart';
import 'package:market_app/model/coffee.dart';
import 'package:market_app/pages/about_page.dart';
import 'package:market_app/pages/shop_page.dart';
class HomePage extends StatefulWidget{
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(onTabChange:  navigateBottomBar),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: EdgeInsets.all(14),
              child: Icon(Icons.menu, color: Colors.black),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
drawer: Drawer(
        backgroundColor: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 80),
                Image.asset("lib/images/espresso.png", height: 160),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Divider(color: Colors.white,),
                  
                ),
                Padding(
                    padding: EdgeInsets.only(left: 25),
                    child:  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                           MaterialPageRoute(builder: (context) => HomePage())
                           );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: ListTile(
                          leading: Icon(Icons.home, color: Colors.black),
                          title: Text("Home"),
                        ),
                      ),
                    ),
                    
                    ),
                    Padding(
                    padding: EdgeInsets.only(left: 25),
                    child:  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                           MaterialPageRoute(builder: (context) => AboutPage())
                           );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: ListTile(
                          leading: Icon(Icons.info, color: Colors.black),
                          title: Text("About"),
                        ),
                      ),
                    ),
                    
                    ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 25,bottom: 25),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ShopPage(),
    );
    
    
  }
}