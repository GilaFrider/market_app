
import 'package:flutter/material.dart';
import 'package:market_app/colors.dart';
import 'package:market_app/components/bottom_nav_bar.dart';
import 'package:market_app/components/my_drawer.dart';
import 'package:market_app/pages/cart_page.dart';
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
  final _pages = [
    ShopPage(), // Add this line
    CartPage(),
  ];
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
      drawer: MyDrawer(),
      body: _pages[_selectedIndex],
    );
    
    
  }
}