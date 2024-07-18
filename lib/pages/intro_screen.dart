import 'package:flutter/material.dart';
import 'package:market_app/colors.dart';
import 'package:market_app/pages/home_page.dart';

class IntroScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: Image.asset("lib/images/espresso.png", height: 200,),
            ),
            SizedBox(height: 48,),
            Text(
              "Brew Day",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 24,),
            Text(
              "How do you like your coffee?",
              style: TextStyle(
                fontSize: 16,
                 color: Colors.brown
                 ),
                 
            ),
            SizedBox(height: 48),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
              ),
              child: Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: Text(
                  "Enter shop",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ), 
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    color: Colors.brown[700],
                    borderRadius: BorderRadius.circular(12),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}