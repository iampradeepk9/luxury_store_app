import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image, width: 50, height: 50),
      title: Text(product.title),
      subtitle: Text("\$${product.price}"),
    );
  }
}