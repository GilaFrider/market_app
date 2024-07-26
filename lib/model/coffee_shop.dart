import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_app/model/coffee.dart';

class CoffeeShop extends ChangeNotifier{
  List<Coffee> _shop = [];
  CoffeeShop(){
    _fetchProducts();
  }

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> _cart = [];

  List<Coffee> get cart => _cart;

  void addToCart(Coffee coffee, int quantity) {
    coffee.quantity = quantity;
    _cart.add(coffee);
    notifyListeners();
  }
  
  void removeFromCart(Coffee coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  void _fetchProducts() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('products').get();
    _shop = snapshot.docs.map((doc){
      return Coffee(
        id: doc.id,
        name: doc['name'],
        price: doc['price'],
        imagePath: doc['imagePath'],
      );
    }).toList();
    notifyListeners();
  }

  Future<void> addProduct(Coffee coffee) async {
    DocumentReference docref =
        await FirebaseFirestore.instance.collection('products').add({
      'name': coffee.name,
      'price': coffee.price,
      'imageUrl': coffee.imagePath,
    });
    coffee.id = docref.id;
    _shop.add(coffee);
    notifyListeners();
  }

Future<void> deleteProduct(Coffee coffee) async{
  await FirebaseFirestore.instance.collection('products').doc(coffee.id).delete();
  _shop.remove(coffee);
  notifyListeners();
}

}