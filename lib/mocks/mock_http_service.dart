

import 'package:widget_compose/network/http/http_sevice.dart';

class MockHttpService extends HttpService {
  dynamic returnData;
  MockHttpService(super.url);

  @override
  Future delete(String path) async {
    return returnData;
  }

  @override
  Future get(String path) async {
    return returnData;
  }

  @override
  Future patch(String path, data) async {
    return returnData;
  }

  @override
  Future post(String path, data) async {
    return returnData;
  }

  @override
  Future put(String path, data) async {
    return returnData;
  }

}