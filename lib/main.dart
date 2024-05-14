import 'package:flutter/material.dart';
import 'package:bookshopv2/pages/bookstore_home.dart';
import 'package:bookshopv2/pages/login_page.dart';
import 'package:bookshopv2/pages/registration_page.dart';

void main() {
  runApp(BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => BookstoreHome(),
      },
    );
  }
}