
import 'package:dio/dio.dart';
import '../../../../app/core/base/base_remote_source.dart';
import '../../../../app/network/dio_provider.dart';
import '../../model/auth/login_response.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl extends BaseRemoteSource implements AuthRemoteDataSource {
  @override
  Future<LoginResponse> login(String emailOrPhone, String password) async {
    var endpoint = "${DioProvider.baseUrl}login";
    var data = {
      "identifier": emailOrPhone,
      "password": password
    };
    var dioCall = dioClient.post(endpoint, data: data);

    try {
      final response = await callApiWithErrorParser(dioCall);
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
