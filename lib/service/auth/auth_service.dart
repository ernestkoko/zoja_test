import 'package:zoja_test/service/auth/i_auth_service.dart';
import 'package:zoja_test/util/util.dart';
import 'package:zoja_test/model/model.dart';

class AuthService implements IAuthService {
  @override
  Future<bool> login(String email, String password) async {
    await simulateNetworkDelay();

    if (validateEmail(email) && password.isNotEmpty) {
      if (email == 'user@example.com' && password == 'password123') {
        return true;
      }
    }

    return false;
  }

  @override
  Future<void> logout() async {
    // await simulateNetworkDelay(1);
  }

  @override
  Future<bool> register(User user) async {

    if (validateEmail(user.email) && user.password.isNotEmpty) {
      if (user.email == 'user@example.com') {
        return false;
      } else {
        return true;
      }
    }

    return false;
  }
}
