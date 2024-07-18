import 'package:flutter/material.dart';
import 'package:market_app/model/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Icon icon;
  final List<String>? titles; // Changed to a list of titles
  final void Function()? onPressed;

  const CoffeeTile({
    required this.coffee,
    required this.icon,
    this.titles, // Changed to a list of titles
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ListTile(
        leading: Image.asset(coffee.imagePath),
        title: Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(coffee.name, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        subtitle: titles != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: titles!.map((title) => Text(title)).toList(),
              )
            : null,
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
