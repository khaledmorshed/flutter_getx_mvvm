
import 'package:flutter/cupertino.dart';

import '/app/core/base/base_controller.dart';
import '../../../data/repository/tenant_repository/tenant_repository.dart';
import '../../../data/model/tenant_model/create_tenant_data_param.dart';

class TenantController extends BaseController {
  final TenantRepository _repository;

  TenantController(this._repository);

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tenantController = TextEditingController();



  void onVerifyTenant() {
    if (tenantController.text.isEmpty) {
      showErrorMessage("Please enter tenant name");
      return;
    }

    callDataService(
      _repository.verifyTenant(
        CreateTenantDataParam(tenant: tenantController.text),
      ),
      onSuccess: (response) {
        // Handle success - e.g. navigate or show success message
        showSuccessMessage("Tenant Verified: ${response}"); // Assuming TenantModel has a tenant field or similar
      },
    );
  }
}
