import 'package:dio/dio.dart';
import 'package:getx_mvvm/flavors/build_config.dart';

import '../data/local/preference/preference_manager.dart';
import '../data/local/preference/preference_manager_impl.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper{
  final logger = BuildConfig.instance.envConfig.logger;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    getCustomHeaders().then((customHeader){
      options.headers.addAll(customHeader);
      // logger.i("HEADERS: >>>>>>>  : ${(options.headers)}");
      // logger.i("DATA: >>>>>>>  : ${(options.data)}");
      // logger.i("QueryParameters: >>>>>>>  : ${(options.queryParameters)}");

      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders()async{
    var customHeaders = {'content-type': 'application/json'};
    String tenant = PreferenceManagerImpl().getString(PreferenceManager.tenant);
    String token = PreferenceManagerImpl().getString(PreferenceManager.token);

    if (tenant.isNotEmpty) {
      customHeaders["Tenant"] = tenant;
    }

    if (token.isNotEmpty) {
      customHeaders["Authorization"] = "Bearer $token";
    }

    return customHeaders;
  }
}