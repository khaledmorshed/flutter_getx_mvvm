import 'package:dio/dio.dart';
import 'package:getx_mvvm/app/data/model/tenant_model/tenant_model.dart';
import 'package:getx_mvvm/app/data/remote/tenant/tenant_remote_data_source.dart';

import '../../../core/base/base_remote_source.dart';
import '../../../network/dio_provider.dart';
import '../../local/preference/preference_manager.dart';
import '../../local/preference/preference_manager_impl.dart';
import '../../model/tenant_model/create_tenant_data_param.dart';

class TenantRemoteDataSourceImpl extends BaseRemoteSource implements TenantRemoteDataSource {

  @override
  Future<TenantModel> verifyTenant(CreateTenantDataParam data, {bool storeDataInLocal = false})async {
    var endpoint = "${DioProvider.baseUrl}/tenants/verify";
    var dioCall = dioClient.get(endpoint, queryParameters: data.toJson());

    try {
      //return callApiWithErrorParser(dioCall).then((response) => _parseTenantResponse(response));
      final response = await callApiWithErrorParser(dioCall);
      final tenant = _parseTenantResponse(response);
      PreferenceManagerImpl().setString(PreferenceManager.tenant, data.tenant);

      return tenant;
    } catch (e) {
      rethrow;
    }
  }

  TenantModel _parseTenantResponse(
      Response<dynamic> response) {
    return TenantModel.fromJson(response.data);
  }

}