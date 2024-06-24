import 'package:zoja_test/service/auth/auth_service.dart';

import '../../model/model.dart';

interface class IAuthService {
  static IAuthService _instance = AuthService();

  static IAuthService get instance => _instance;

  static set instance(IAuthService authService) {
    _instance = authService;
  }

  Future<bool> login(String email, String password) {
    throw UnimplementedError('login is not implemented yet.');
  }

  Future<void> logout() {
    throw UnimplementedError('logout is not implemented yet.');
  }

  Future<bool> register(User user) {
    throw UnimplementedError('register is not implemented yet.');
  }
}
