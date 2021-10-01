import 'package:flutter/material.dart';
import 'package:login_ui/models/model.dart';

class CartPage extends StatefulWidget {
  static List<Item> inCart = [];
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();

  static void addToCart(Item catalog) {
    // catalog.inCart = true;
    inCart.add(catalog);
  }

  static void removeFromCart(Item catalog) {
    // catalog.inCart = false;
    inCart.removeWhere((element) => element.id == catalog.id);
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueGrey[900],
        ),
        body: CartPage.inCart.isNotEmpty
            ? ListView.builder(
                itemCount: CartPage.inCart.length,
                itemBuilder: (context, index) {
                  final catalog = CartPage.inCart[index];
                  return Card(
                    child: ListTile(
                        leading: Image.network(catalog.image),
                        title: Text(catalog.name),
                        subtitle: Text(catalog.desc),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: Text("Buy"),
                        )),
                  );
                },
              )
            : const Center(
                child: Text("Cart is Empty!"),
              ));
  }
}
