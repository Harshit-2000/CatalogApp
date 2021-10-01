// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_ui/models/model.dart';
import 'package:login_ui/utils/routes.dart';
import 'package:login_ui/widgets/drawer.dart';
import 'package:login_ui/widgets/home_page_widgets/catalog_header.dart';
import 'package:login_ui/widgets/home_page_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeJson = jsonDecode(catalogJson);
    var productsData = decodeJson["products"];

    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey[900],
        title: Text(
          "Catalog App",
          textScaleFactor: 1.2,
        ),
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
          child: Container(
        padding: EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              Expanded(child: CatalogList())
            else
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      )),
      drawer: Drawer(child: MyDrawer()),
    );
  }
}
