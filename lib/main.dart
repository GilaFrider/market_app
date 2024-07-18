import 'package:flutter/material.dart';
import 'package:market_app/model/coffee_shop.dart';
import 'package:market_app/pages/intro_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return  ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
      ),
    );
  }
}