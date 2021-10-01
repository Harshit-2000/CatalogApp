// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Trending Products",
            style: TextStyle(
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
