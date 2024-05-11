import 'package:flutter/material.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/widgets/elements/texts/big_text.dart';
import 'package:widget_compose/widgets/elements/texts/price_text.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          title: product.category,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.network(
              product.imageUrl,
              width: screenWidth,
              height: screenWidth * 0.75,
              fit: BoxFit.contain,
            ),
            TextTitle(
              title: product.name,
            ),
            Text(
              product.description!,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PriceText(
                  price: '${product.price}\$',
                  fontsize: 30,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                "Buy Now",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
