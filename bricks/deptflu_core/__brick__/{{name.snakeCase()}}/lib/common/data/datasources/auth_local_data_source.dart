import 'dart:convert';

import 'package:{{name.snakeCase()}}/cores/constants/local_storage_fields.dart';
import 'package:{{name.snakeCase()}}/cores/services/logger_service.dart';
import 'package:{{name.snakeCase()}}/cores/services/secure_storage_service.dart';
import 'package:{{name.snakeCase()}}/cores/services/shared_pref_service.dart';

import '../models/user_session_model.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveUserData(UserSessionModel model);

  Future<UserSessionModel?> get userData;

  Future<void> saveAccessToken(String token);

  Future<String?> get accessToken;

  Future<void> saveRefreshToken(String token);

  Future<String?> get refreshToken;

  Future<void> saveUserId(String id);

  Future<String?> get userId;

  Future<void> destroySession();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String TAG = "AuthLocalDataSourceImpl";

  final SharedPrefService sharedPrefService;
  final SecureStorageService secureStorageService;

  AuthLocalDataSourceImpl({
    required this.sharedPrefService,
    required this.secureStorageService,
  });

  @override
  Future<UserSessionModel?> get userData async {
    try {
      final result = await sharedPrefService.getString(
        LocalStorageFields.userData,
      );

      if (result != null) {
        return UserSessionModel.fromJson(json.decode(result));
      }

      return null;
    } catch (e) {
      LoggerService.instance().error("$TAG => ${e.toString()}");
      return null;
    }
  }

  @override
  Future<String?> get accessToken async => secureStorageService.accessToken;

  @override
  Future<String?> get refreshToken => secureStorageService.refreshToken;

  @override
  Future<String?> get userId => secureStorageService.userId;

  @override
  Future<void> saveUserData(UserSessionModel model) async {
    try {
      await sharedPrefService.setString(
        key: LocalStorageFields.userData,
        value: json.encode(model.toJson()),
      );
    } catch (e) {
      LoggerService.instance().error("$TAG => ${e.toString()}");
    }
  }

  @override
  Future<void> saveAccessToken(String token) async {
    try {
      await secureStorageService.saveAccessToken(token);
    } catch (e) {
      LoggerService.instance().error("$TAG => ${e.toString()}");
    }
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    try {
      await secureStorageService.saveRefreshToken(token);
    } catch (e) {
      LoggerService.instance().error("$TAG => ${e.toString()}");
    }
  }

  @override
  Future<void> saveUserId(String id) async {
    try {
      await secureStorageService.saveUserId(id);
    } catch (e) {
      LoggerService.instance().error("$TAG => ${e.toString()}");
    }
  }

  @override
  Future<void> destroySession() async {
    try {
      await Future.wait([
        secureStorageService.clearUserSession(),
        sharedPrefService.remove(LocalStorageFields.userData),
      ]);
    } catch (e) {
      LoggerService.instance().error("$TAG => ${e.toString()}");
    }
  }
}
