
import 'package:get/get.dart';
import '../../../../app/data/remote/auth/auth_remote_data_source.dart';
import '../../../../app/data/remote/auth/auth_remote_data_source_impl.dart';
import '../../../../app/data/repository/auth/auth_repository.dart';
import '../../../../app/data/repository/auth/auth_repository_impl.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
      tag: (AuthRemoteDataSource).toString(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find(tag: (AuthRemoteDataSource).toString())),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find()),
    );
  }
}
