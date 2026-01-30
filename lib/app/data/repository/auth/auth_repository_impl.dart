
import '../../remote/auth/auth_remote_data_source.dart';
import '../../model/auth/login_response.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteSource;

  AuthRepositoryImpl(this._remoteSource);

  @override
  Future<LoginResponse> login(String emailOrPhone, String password) {
    return _remoteSource.login(emailOrPhone, password);
  }
}
