
import '../../model/client/client_model.dart';

abstract class ClientRepository {
  Future<ClientListResponse> getClients(int page);
  Future<dynamic> createClient(Map<String, dynamic> data);
}
