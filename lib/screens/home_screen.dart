import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:widget_compose/di/get_it.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/network/http/dio_service.dart';
import 'package:widget_compose/repositories/product_repository.dart';
import 'package:widget_compose/services/product_service.dart';
// import 'package:widget_compose/mocks/products.dart';
import 'package:widget_compose/widgets/compounds/cards/product_card.dart';
import 'package:widget_compose/widgets/compounds/jumbotron/home_jumbotron.dart';
import 'package:widget_compose/widgets/compounds/list/product_list.dart';
import 'package:widget_compose/widgets/compounds/loading/loading_indicator.dart';
import 'package:widget_compose/widgets/compounds/navbar/home_nav.dart';
import 'package:widget_compose/widgets/compounds/sections/catalog.dart';
import 'package:widget_compose/widgets/elements/inputs/search_input.dart';

import '../mocks/products.dart';
import '../port/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IProductService service = getIt.get<IProductService>();

  List<List<ProductToDisplay>> products = [];
  List<String> categories = [];

  bool isLoading = false;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() async {
    setState(() {
      isLoading = true;
    });
    // Get category ทั้งหมด
    final categories = await service.getCategories();
    // Loop สร้าง Future list ในการเรียกดู product by category เอาไว้
    final productsFetchers = categories.map((e) => service.getByCategory(e));
    // เอา Future list ทั้งหมดมารอ reponse พร้อมๆกัน
    // ข้อดี: ทุกเส้นถูกเรียกพร้อมกัน ใช้เวลาเท่าเส้นที่เรียกนานที่สุด
    // ข้อเสีย: Server รับ load มากขึ้น เพราะถูกเรียกพร้อมกันทีเดียวหลายเส้น ต้องมีการวางแผน scaling ที่ดี
    final products = await Future.wait(productsFetchers);

    setState(() {
      this.categories = categories;
      this.products = products;
      isLoading = false;
    });
  }

  void onSelectProduct(ProductToDisplay product) {
    context.go('/detail');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const HomeNavbar(),
            Expanded(
                child: isLoading
                    ? const Loading()
                    : ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              HomeJumbotron(
                                  imageUrl: categoryImages[categories[index]]!,
                                  title: categories[index].toUpperCase(),
                                  buttonTitle: 'View Collection'),
                              Catalog(
                                title: 'All products',
                                products: products[index],
                                onSelectProduct: onSelectProduct,
                              ),
                              const SizedBox(
                                height: 24,
                              )
                            ],
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
