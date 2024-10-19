// home_page.dart
import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> _items = [
    Item(
      name: 'sugar',
      price: 5000,
      image: 'assets/images/sugar.jpg',
      stock: 10,
      rating: 4.5,
    ),
    Item(
      name: 'salt',
      price: 2000,
      image: 'assets/images/salt.jpg',
      stock: 20,
      rating: 4.0,
    ),
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10, // jarak antara item-item secara horizontal
            mainAxisSpacing: 10, // jarak antara item-item secara vertikal
            childAspectRatio:
                1, // tambahkan childAspectRatio untuk mengatur ukuran item
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceAround, // posisi anak-anak secara vertikal
                    children: [
                      Image.asset(item.image, height: 100),
                      Text(
                        item.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Rp ${item.price}',
                        style: TextStyle(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Stock: ${item.stock}',
                        style: TextStyle(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Rating: ${item.rating}',
                        style: TextStyle(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
