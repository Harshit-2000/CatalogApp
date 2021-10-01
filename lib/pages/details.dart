// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/models/model.dart';
import 'package:login_ui/utils/routes.dart';
import 'package:login_ui/widgets/details_footer.dart';

class CatalogDetails extends StatelessWidget {
  final Item catalog;

  const CatalogDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            icon: Icon(CupertinoIcons.cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Hero(
                tag: Key(catalog.id.toString()),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    catalog.image,
                  ),
                ),
              ),
            ),
            Text(
              catalog.name.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              catalog.desc.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DetailsFooter(
        catalog: catalog,
      ),
    );
  }
}
