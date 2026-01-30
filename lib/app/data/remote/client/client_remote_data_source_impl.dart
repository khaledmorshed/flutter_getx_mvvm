
import 'package:dio/dio.dart';
import '../../../../app/core/base/base_remote_source.dart';
import '../../../../app/network/dio_provider.dart';
import '../../model/client/client_model.dart';
import 'client_remote_data_source.dart';

class ClientRemoteDataSourceImpl extends BaseRemoteSource implements ClientRemoteDataSource {
  @override
  Future<ClientListResponse> getClients(int page) async {
    var endpoint = "${DioProvider.baseUrl}clients";
    var queryParams = {'page': page, 'limit': 20};
    var dioCall = dioClient.get(endpoint, queryParameters: queryParams);

    try {
      final response = await callApiWithErrorParser(dioCall);
      return ClientListResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> createClient(Map<String, dynamic> data) async {
    var endpoint = "${DioProvider.baseUrl}/clients";
    var dioCall = dioClient.post(endpoint, data: data);

    try {
      final response = await callApiWithErrorParser(dioCall);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
