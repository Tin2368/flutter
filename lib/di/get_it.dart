import 'package:get_it/get_it.dart';
import 'package:widget_compose/network/http/dio_service.dart';
import 'package:widget_compose/network/http/http_sevice.dart';
import 'package:widget_compose/port/product.dart';
import 'package:widget_compose/repositories/product_repository.dart';
import 'package:widget_compose/services/product_service.dart';

final getIt = GetIt.instance;

void registerServices() {
  getIt.registerSingleton<HttpService>(DioService('https://fakestoreapi.com'));
  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<IProductService>(ProductService());

}