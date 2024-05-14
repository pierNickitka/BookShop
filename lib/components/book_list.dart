import 'package:flutter/material.dart';
import '../models/book.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            leading: Image.network(
              bookList[index].image,
              width: 50,
              height: 70,
              fit: BoxFit.cover,
            ),
            title: Text(bookList[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bookList[index].author),
                Text('Price: \$${bookList[index].price}'),
                Text('Year: ${bookList[index].year}'),
                Text('Edition: ${bookList[index].edition}'),
              ],
            ),
            trailing: Icon(Icons.info),
            onTap: () {
              _showBookDetails(context, bookList[index]);
            },
          ),
        );
      },
    );
  }

  void _showBookDetails(BuildContext context, Book book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(book.title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Image.network(
                  book.image,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                Text('Author: ${book.author}'),
                Text('Description: ${book.description}'),
                Text('Price: \$${book.price}'),
                Text('Year: ${book.year}'),
                Text('Edition: ${book.edition}'),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  tooltip: 'Add to Cart',
                  onPressed: () {
                    _showAddedToCartNotification(context, book);
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  tooltip: 'Add to Favorites',
                  onPressed: () {
                    _showFavoriteAddedNotification(context, book);
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.monetization_on),
                  tooltip: 'Buy Now',
                  onPressed: () {
                    _showPurchaseConfirmationDialog(context, book);
                  },
                ),
              ],
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

void _showPurchaseConfirmationDialog(BuildContext context, Book book) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Purchase'),
        content: Text(
            'Are you sure you want to purchase "${book.title}" for \$${book.price}?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              Navigator.of(context)
                  .pop();  
              Navigator.of(context)
                  .pop();  
            },
          ),
        ],
      );
    },
  );
}

void _showFavoriteAddedNotification(BuildContext context, Book book) {
  final ScaffoldMessengerState scaffoldMessenger =
      ScaffoldMessenger.of(context);
  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text('"${book.title}" has been added to your favorites.'),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Обработка отмены добавления в избранное
        },
      ),
    ),
  );
}

void _showAddedToCartNotification(BuildContext context, Book book) {
  final ScaffoldMessengerState scaffoldMessenger =
      ScaffoldMessenger.of(context);
  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text('"${book.title}" has been added to your cart.'),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
        },
      ),
    ),
  );
}
