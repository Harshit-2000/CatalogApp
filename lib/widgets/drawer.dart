// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Harshit"),
                accountEmail: Text("harshit@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
              )),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
            ),
            title: Text(
              "Contact",
              textScaleFactor: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
