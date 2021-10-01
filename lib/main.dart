import 'package:flutter/material.dart';
import 'package:login_ui/pages/cart_page.dart';
import 'package:login_ui/pages/login_page.dart';
import 'package:login_ui/utils/routes.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
