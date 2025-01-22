import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final TokenService tokenService = TokenService();
// String? token = await tokenService.getToken('authToken');

class TokenService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // save Token method
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: 'authToken', value: token);
  }

  // get Token method
  Future<String?> getToken(String key) async {
    return await secureStorage.read(key: 'authToken');
  }

  // delete Token method
  Future<void> deleteToken(String key) async {
    await secureStorage.delete(key: 'authToken');
  }
}
