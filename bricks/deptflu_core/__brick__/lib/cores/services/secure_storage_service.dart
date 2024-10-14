import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{name.snakeCase()}}/cores/constant/local_storage_fields.dart';

class SecureStorageService {
  static late FlutterSecureStorage _storage;

  SecureStorageService._() {
    _storage = GetIt.I.get<FlutterSecureStorage>();
  }

  static SecureStorageService get instance => SecureStorageService._();

  Future<String?> get userId async =>
      _storage.read(key: LocalStorageFields.userId);

  Future<String?> get userToken async =>
      _storage.read(key: LocalStorageFields.userToken);

  Future<String?> get refreshToken async =>
      _storage.read(key: LocalStorageFields.refreshToken);

  Future<void> saveUserSession({
    required String userId,
    required String userToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: LocalStorageFields.userId, value: userId),
      _storage.write(key: LocalStorageFields.userToken, value: userToken),
      _storage.write(key: LocalStorageFields.refreshToken, value: refreshToken),
    ]);
  }

  Future<void> clearUserSession() async {
    await Future.wait([
      _storage.delete(key: LocalStorageFields.userId),
      _storage.delete(key: LocalStorageFields.userToken),
      _storage.delete(key: LocalStorageFields.refreshToken),
    ]);
  }
}
