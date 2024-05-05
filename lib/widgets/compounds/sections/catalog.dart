import 'package:flutter/cupertino.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/widgets/compounds/list/product_list.dart';
import 'package:widget_compose/widgets/elements/texts/text_title.dart';

class Catalog extends StatelessWidget {

  final List<ProductToDisplay> products;
  final String title;

  const Catalog({super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: TextTitle(title: title),
        ),
        ProductList(products: products)
      ],
    );
  }
  
}