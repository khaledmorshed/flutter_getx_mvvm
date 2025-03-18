import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    getCustomHeaders().then((customHeader){
      options.headers.addAll(customHeader);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders()async{
    var customHeaders = {'content-type': 'application/json'};
    return customHeaders;
  }
}