
import '../../model/auth/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String emailOrPhone, String password);
}
