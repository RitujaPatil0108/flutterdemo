import 'package:flutter/material.dart';
import 'package:pieproject/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback addToCart;

  ProductCard({required this.product, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Discount: ${product.category}% Off',
            style: TextStyle(color: Colors.green),
          ),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: addToCart,
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
