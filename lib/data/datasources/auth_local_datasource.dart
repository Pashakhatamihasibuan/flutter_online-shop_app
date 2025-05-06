import 'package:shared_preferences/shared_preferences.dart';

import '../models/responses/auth_response_model.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(AuthResponseModel auth) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', auth.toJson());
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  Future<AuthResponseModel?> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return AuthResponseModel.fromJson(authData);
    }
    return null;
  }

  Future<bool> isAuth() async {
    // check if user is authenticated
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return true;
    }
    return false;
  }
}
