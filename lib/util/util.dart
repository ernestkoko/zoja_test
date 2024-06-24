
Future<void> simulateNetworkDelay([int seconds = 2]) async {
  await Future.delayed(Duration(seconds: seconds));
}

bool validateEmail(String email) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(email);
}
