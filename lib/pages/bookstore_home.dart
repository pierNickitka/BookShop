import 'package:flutter/material.dart';
import 'package:bookshopv2/components/book_list.dart';

class BookstoreHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            alignment: Alignment.topRight,
            icon: Icon(Icons.account_circle),
            iconSize: 40,
            tooltip: 'Аккаунт',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            iconSize: 25,
            tooltip: 'Избранное',
            onPressed: () {
              Navigator.pushNamed(context, '/favorite');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            iconSize: 25,
            tooltip: 'Корзина',
            onPressed: () {
              Navigator.pushNamed(context, '/shopping_cart');
            },
          ),
        ],
        title: Text('Bookstore'),
      ),
      body: BookList(),
    );
  }
}
