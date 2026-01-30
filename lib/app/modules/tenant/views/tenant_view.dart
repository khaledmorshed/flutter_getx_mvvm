import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/widgets/custom_text_form_field.dart';
import '../controllers/tenant_controller.dart';
import '/app/core/base/base_view.dart';


class TenantView extends BaseView<TenantController> {
   TenantView({super.key});

  //  TenantView() {
  //
  // }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            labelText: "Store Name",
            controller: controller.tenantController,
          ),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: (){
            controller.onVerifyTenant();
            }, child: Text("submit"),
          )

        ],
      ),
    );
  }
}
