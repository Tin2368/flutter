import 'package:widget_compose/di/get_it.dart';
import 'package:widget_compose/models/Product.dart';
import 'package:widget_compose/network/http/http_sevice.dart';
import 'package:widget_compose/port/product.dart';

class ProductRepository implements IProductRepository {

  final HttpService httpService = getIt.get<HttpService>();

  // ProductRepository(this.httpService);

  @override
  Future<List<Product>> getByCategory(String category) async {
    final response = await httpService.get('/products/category/$category');
    List<Product> products = [];
    for(dynamic res in response) {
      products.add(Product.fromJson(res));
    }
    return products;
  }

  @override
  Future<List<String>> getCategories() async {
    final response = await httpService.get('/products/categories');
    return (response as List<dynamic>).map((e) => e.toString()).toList();
  }

}