import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pieproject/models/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Calling build of cart");
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.cartItems.length,
        itemBuilder: (context, index) {
          final product = cart.cartItems[index];

          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.title),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  cart.removeItem(product);
                },
              ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.clearCart();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
