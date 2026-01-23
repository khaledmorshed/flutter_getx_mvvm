import 'package:dio/dio.dart';

import '../data/local/preference/preference_manager.dart';
import '../data/local/preference/preference_manager_impl.dart';

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
    String tenant = PreferenceManagerImpl().getString(PreferenceManager.tenant);

    if (tenant.isNotEmpty) {
      customHeaders["Tenant"] = tenant;   // added dynamically
    }

    return customHeaders;
  }
}