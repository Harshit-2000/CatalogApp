// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/models/model.dart';
import 'package:login_ui/pages/cart_page.dart';

class DetailsFooter extends StatefulWidget {
  Item catalog;

  DetailsFooter({Key? key, required this.catalog}) : super(key: key);

  @override
  _DetailsFooterState createState() => _DetailsFooterState();
}

class _DetailsFooterState extends State<DetailsFooter> {
  final _addedToCartMessage =
      SnackBar(content: Text("Added to Cart"), duration: Duration(seconds: 1));

  final _removedFromCartMessage = SnackBar(
      content: Text("Removed from Cart"), duration: Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(
              "\$${widget.catalog.price}",
              style: TextStyle(
                fontSize: 40,
                color: Colors.green[900],
              ),
            ),
          ),
          if (!widget.catalog.inCart)
            RawMaterialButton(
              onPressed: () {
                CartPage.addToCart(widget.catalog);
                setState(() {
                  widget.catalog.inCart = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(_addedToCartMessage);
              },
              child: Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
              ),
              fillColor: Colors.blue,
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            )
          else
            RawMaterialButton(
              onPressed: () {
                CartPage.removeFromCart(widget.catalog);
                setState(() {
                  widget.catalog.inCart = false;
                });
                ScaffoldMessenger.of(context)
                    .showSnackBar(_removedFromCartMessage);
              },
              child: Icon(
                CupertinoIcons.cart_badge_minus,
                color: Colors.white,
              ),
              fillColor: Colors.red[900],
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            ),
        ],
      ),
    );
  }
}
