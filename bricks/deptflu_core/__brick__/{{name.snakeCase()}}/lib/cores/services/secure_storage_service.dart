import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{name.snakeCase()}}/cores/constants/local_storage_fields.dart';

class SecureStorageService {
  static late FlutterSecureStorage _storage;

  SecureStorageService._() {
    _storage = GetIt.I.get<FlutterSecureStorage>();
  }

  static SecureStorageService get instance => SecureStorageService._();

  Future<String?> get userId async =>
      _storage.read(key: LocalStorageFields.userId);

  Future<String?> get accessToken async =>
      _storage.read(key: LocalStorageFields.accessToken);

  Future<String?> get refreshToken async =>
      _storage.read(key: LocalStorageFields.refreshToken);

  Future<void> saveUserId(String id) async =>
      _storage.write(key: LocalStorageFields.userId, value: id);

  Future<void> saveAccessToken(String token) async =>
      _storage.write(key: LocalStorageFields.accessToken, value: token);

  Future<void> saveRefreshToken(String token) async =>
      _storage.write(key: LocalStorageFields.refreshToken, value: token);

  Future<void> clearUserSession() async {
    await Future.wait([
      _storage.delete(key: LocalStorageFields.userId),
      _storage.delete(key: LocalStorageFields.accessToken),
      _storage.delete(key: LocalStorageFields.refreshToken),
    ]);
  }
}
