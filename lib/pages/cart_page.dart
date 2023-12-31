import 'package:flutter/material.dart';
import 'package:simple_sushi_restaurant_app/components/button.dart';
import 'package:simple_sushi_restaurant_app/models/food.dart';
import 'package:simple_sushi_restaurant_app/models/shop.dart';
import 'package:simple_sushi_restaurant_app/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();
    // remove from cart
    shop.removeFromCart(food);
  }

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("My Cart"),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // CUSTOMER CART
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];
                  // get food name
                  final String foodName = food.name;
                  // get food price
                  final String foodPrice = food.price;
                  // return list tile
                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey.shade300,
                        ),
                        onPressed: ()=>removeFromCart(food,context),
                      ),
                    ),
                  );
                },
              ),
            ),
            // PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}