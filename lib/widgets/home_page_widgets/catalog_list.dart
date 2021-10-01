// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_ui/models/model.dart';
import 'package:login_ui/pages/details.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: CatalogModel.items!.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items![index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CatalogDetails(
                  catalog: catalog,
                ),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}

class CatalogItem extends StatefulWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  State<CatalogItem> createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.catalog.inCart ? Colors.lightGreen[50] : Colors.white,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Hero(
                    tag: Key(widget.catalog.id.toString()),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.catalog.image)),
                  ),
                ),
              ),
              Text(
                widget.catalog.name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.catalog.desc,
                style: TextStyle(
                  fontSize: 10,
                ),
              )
            ],
          )),
    );
  }
}
