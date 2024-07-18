import 'package:flutter/material.dart';
import 'package:market_app/colors.dart';
import 'package:market_app/components/coffee_tile.dart';
import 'package:market_app/components/my_button.dart';
import 'package:market_app/model/coffee.dart';
import 'package:market_app/model/coffee_shop.dart';
import 'package:market_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double _totalPrice(List<Coffee> coffees) {
    double totalPrice = 0;
    for (var coffee in coffees) {
      totalPrice += coffee.price * coffee.quantity;
    }
    return totalPrice;
  }

  int _sumOfProducts(List<Coffee> coffees) {
    int totalQuantity = 0;
    for (var coffee in coffees) {
      totalQuantity += coffee.quantity;
    }
    return totalQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Your Cart'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Consumer<CoffeeShop>(
        builder: (context, coffeeShop, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: coffeeShop.cart.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = coffeeShop.cart[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.brown[300],
                      ),
                      titles: [
                        'Quantity: ${eachCoffee.quantity}',
                        '\$${eachCoffee.price}',
                      ],
                      onPressed: () => coffeeShop.removeFromCart(eachCoffee),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '\$${_totalPrice(coffeeShop.cart).toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Products: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${_sumOfProducts(coffeeShop.cart)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              MyButton(
                text: 'Pay Now',
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  PaymentPage(onPaymentSuccess: coffeeShop.clearCart),
                    ),
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
