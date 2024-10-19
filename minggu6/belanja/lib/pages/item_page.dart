import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(itemArgs.image, height: 200),
              Text('Nama: ${itemArgs.name}'),
              Text('Harga: Rp ${itemArgs.price}'),
              Text('Stock: ${itemArgs.stock}'),
              Text('Rating: ${itemArgs.rating}'),
              SizedBox(height: 20), // tambahkan spasi di bawah konten
            ],
          ),
        ),
      ),
    );
  }
}
