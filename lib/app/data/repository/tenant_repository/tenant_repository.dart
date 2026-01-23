import '../../model/tenant_model/create_tenant_data_param.dart';
import '../../model/tenant_model/tenant_model.dart';

abstract class TenantRepository {
  Future<TenantModel> verifyTenant(CreateTenantDataParam data, {bool storeDataInLocal = false});
}
