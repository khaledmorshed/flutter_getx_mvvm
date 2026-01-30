
import 'package:get/get.dart';
import '../../../../app/data/remote/client/client_remote_data_source.dart';
import '../../../../app/data/remote/client/client_remote_data_source_impl.dart';
import '../../../../app/data/repository/client/client_repository.dart';
import '../../../../app/data/repository/client/client_repository_impl.dart';
import '../controllers/client_controller.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientRemoteDataSource>(
      () => ClientRemoteDataSourceImpl(),
      tag: (ClientRemoteDataSource).toString(),
    );
    Get.lazyPut<ClientRepository>(
      () => ClientRepositoryImpl(Get.find(tag: (ClientRemoteDataSource).toString())),
    );
    Get.lazyPut<ClientController>(
      () => ClientController(Get.find()),
    );
  }
}
