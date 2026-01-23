import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/app/data/model/tenant_model/tenant_model.dart';
import 'package:getx_mvvm/app/data/remote/tenant/tenant_remote_data_source.dart';
import 'package:getx_mvvm/app/data/repository/tenant_repository/tenant_repository.dart';

import '../../model/tenant_model/create_tenant_data_param.dart';

class TenantRepositoryImpl implements TenantRepository {
  final TenantRemoteDataSource _remoteSource;

  TenantRepositoryImpl(this._remoteSource);

  @override
  Future<TenantModel> verifyTenant(CreateTenantDataParam data, {bool storeDataInLocal = false}) {
    return _remoteSource.verifyTenant(data);
  }

}
