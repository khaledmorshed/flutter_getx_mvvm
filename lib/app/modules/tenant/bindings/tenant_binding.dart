import 'package:get/get.dart';

import '../controllers/tenant_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '../../../data/remote/tenant/tenant_remote_data_source.dart';
import '../../../data/remote/tenant/tenant_remote_data_source_impl.dart';
import '../../../data/repository/tenant_repository/tenant_repository.dart';
import '../../../data/repository/tenant_repository/tenant_repository_impl.dart';

class TenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TenantRemoteDataSource>(
      () => TenantRemoteDataSourceImpl(),
      tag: (TenantRemoteDataSource).toString(),
    );
    Get.lazyPut<TenantRepository>(
      () => TenantRepositoryImpl(Get.find(tag: (TenantRemoteDataSource).toString())),
    );
    Get.lazyPut<TenantController>(
      () => TenantController(Get.find()),
    );
  }
}
