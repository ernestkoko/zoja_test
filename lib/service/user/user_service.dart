import '../../model/model.dart';
import '../service.dart';

class UserService implements IUserService {
  final IAuthService authService;

  UserService({required this.authService});

  @override
  Future<bool> login(String email, String password) async {
    return await authService.login(email, password);
  }

  @override
  Future<void> logout() async {
    return await authService.logout();
  }

  @override
  Future<bool> register(User user) async {
    return await authService.register(user);
  }

// Add other user-related functionalities here if needed
}
