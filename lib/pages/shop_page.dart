import 'package:flutter/material.dart';
import 'package:market_app/components/coffee_tile.dart';
import 'package:market_app/model/coffee.dart';
import 'package:market_app/model/coffee_shop.dart';
import 'package:market_app/pages/coffee_oreder_page.dart.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void goToCoffeePage(Coffee coffee) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CoffeeOrederPage(coffee: coffee)));
  }

  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Text(
              "How do you love your coffee?",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.coffeeShop.length,
              itemBuilder: (context, index) {
                Coffee eachCoffee = value.coffeeShop[index];
                return CoffeeTile(
                  coffee: eachCoffee,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.brown[300],
                  ),
                  titles: ['\$${eachCoffee.price}'],
                  onPressed: () => goToCoffeePage(eachCoffee),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
