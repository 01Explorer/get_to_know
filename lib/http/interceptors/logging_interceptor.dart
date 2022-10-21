import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    if (data != null) {
      print('Request');
      print('url: ${data.url}');
      print('headers: ${data.headers}');
      print('body: ${data.body}');
      return data;
    }
    throw Exception;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    if (data != null) {
      print('Response');
      print('status code: ${data.statusCode}');
      print('headers: ${data.headers}');
      print('body: ${data.body}');
      return data;
    }
    throw Exception;
  }
}
