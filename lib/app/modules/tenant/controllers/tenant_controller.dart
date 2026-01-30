
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '../../../data/repository/tenant_repository/tenant_repository.dart';
import '../../../data/model/tenant_model/create_tenant_data_param.dart';
import '../../../data/local/preference/preference_manager.dart';
import '../../../data/local/preference/preference_manager_impl.dart';
import '../../../routes/app_pages.dart';

class TenantController extends BaseController {
  final TenantRepository _repository;

  TenantController(this._repository);

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
        // Handle success
        if(response.results != null){
           PreferenceManagerImpl().setString(PreferenceManager.companyName, response.results!.companyName ?? "");
           PreferenceManagerImpl().setString(PreferenceManager.companyLogo, response.results!.companyLogo ?? "");
           PreferenceManagerImpl().setString(PreferenceManager.tenant, tenantController.text);
        }
        
        showSuccessMessage("Tenant Verified: ${response.results?.companyName}");
        Get.offAllNamed(Routes.LOGIN);
      },
    );
  }
}
