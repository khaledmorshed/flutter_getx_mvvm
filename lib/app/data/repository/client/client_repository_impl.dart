
import '../../remote/client/client_remote_data_source.dart';
import '../../model/client/client_model.dart';
import 'client_repository.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientRemoteDataSource _remoteSource;

  ClientRepositoryImpl(this._remoteSource);

  @override
  Future<ClientListResponse> getClients(int page) {
    return _remoteSource.getClients(page);
  }

  @override
  Future<dynamic> createClient(Map<String, dynamic> data) {
    return _remoteSource.createClient(data);
  }
}
