
import '../../model/auth/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String emailOrPhone, String password);
}
