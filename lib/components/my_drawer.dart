import 'package:flutter/material.dart';
import 'package:market_app/colors.dart';
import 'package:market_app/pages/about_page.dart';
import 'package:market_app/pages/home_page.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
      );
  }
}