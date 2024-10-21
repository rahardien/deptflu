import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{name.snakeCase()}}/cores/injection.dart';

class SharedPrefService {
  final SharedPreferences _pref;

  SharedPrefService._(this._pref);

  static Future<SharedPrefService> get instance async {
    final pref = await sl.getAsync<SharedPreferences>();
    return SharedPrefService._(pref);
  }

  Future<void> setString({required String key, required String value}) async {
    await _pref.setString(key, value);
  }

  Future<String?> getString(String key) async => _pref.getString(key);

  Future<void> setBool({required String key, required bool value}) async {
    await _pref.setBool(key, value);
  }

  Future<bool?> getBool(String key) async => _pref.getBool(key);

  Future<void> setInt({required String key, required int value}) async {
    await _pref.setInt(key, value);
  }

  Future<int?> getInt(String key) async => _pref.getInt(key);

  Future<bool> setMap({required String key, required Map value}) async =>
      await _pref.setString(key, jsonEncode(value));

  Map getMap(String key) {
    final data = _pref.getString(key);

    if (data == '' || data == null) {
      return jsonDecode('{}');
    } else {
      return jsonDecode(data);
    }
  }

  Future<bool> setList({required String key, required List value}) async =>
      await _pref.setString(key, jsonEncode(value));

  List getList(String key) => jsonDecode(_pref.getString(key) ?? '[]');

  Future<bool> remove(String key) => _pref.remove(key);

  Future<void> clear() async {
    await _pref.clear();
  }
}
