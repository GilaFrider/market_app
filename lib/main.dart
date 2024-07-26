import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_app/firebase_option.dart';
import 'package:market_app/model/coffee_shop.dart';
import 'package:market_app/pages/login_page.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // 
  runApp(
    MyApp(),
  );
}
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return  ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}