import '../../data/local/preference/preference_manager.dart';
import '../../data/local/preference/preference_manager_impl.dart';

class TokenCheck {

  /// Get tenant
  static String getTenant(){
    final PreferenceManager _preference = PreferenceManagerImpl();
    String token = _preference.getString(
      PreferenceManager.tenant,
    );
    return token;
  }

  /// Get user token
  static String getUserToken(){
    final PreferenceManager _preference = PreferenceManagerImpl();
    String token = _preference.getString(
      PreferenceManager.token,
    );
    return token;
  }

}