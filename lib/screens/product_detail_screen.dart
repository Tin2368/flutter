import 'package:flutter/material.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/repositories/product_repository.dart';
import 'package:widget_compose/widgets/elements/texts/price_text.dart';
import 'package:widget_compose/widgets/elements/texts/small_text.dart';
import 'package:widget_compose/widgets/elements/texts/text_title.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductToDisplay product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.category),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
          Image.network(product.imageUrl,fit: BoxFit.cover,),
          TextTitle(title: product.name,),
          Text(product.description!,style: const TextStyle(
                color: Colors.grey, 
              ),
              ), 
          PriceText(price: 'Price : ${product.price}',color: Colors.redAccent,)
        ],),
      ),
    );
  }
}
