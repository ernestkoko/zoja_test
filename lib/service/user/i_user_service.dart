import 'package:zoja_test/service/auth/i_auth_service.dart';

import '../../model/model.dart';
import './user_service.dart';

interface class IUserService {
  static IUserService _instance =
      UserService(authService: IAuthService.instance);

  static IUserService get instance => _instance;

  static set instance(IUserService userService) {
    _instance = userService;
  }

  Future<bool> login(String email, String password) {
    throw UnimplementedError("login not implemented");
  }

  Future<void> logout() {
    throw UnimplementedError("logout not implemented");
  }

  Future<bool> register(User user) {
    throw UnimplementedError("register not implemented");
  }
}
