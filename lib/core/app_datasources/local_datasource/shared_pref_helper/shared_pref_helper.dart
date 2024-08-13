import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_constants/app_features.dart';
import '../../remote_datasource/api_constants.dart';
import 'shared_pref_constants.dart';

abstract class SharedPrefHelper {
  T? get<T>(String key);

  Future<bool> set<T>(String key, T value);

  Future<bool> remove(String key);
}

class SharedPrefHelperImpl extends SharedPrefHelper {
  final SharedPreferences _pref;

  SharedPrefHelperImpl(this._pref);

  @override
  T? get<T>(String key) {
    if (key == SharedPrefConstants.handshakeToken &&
        !AppFeatures.enableHandshake) {
      return ApiConstants.adminToken as T;
    }
    final result = _pref.get(key);
    if (result is T) {
      return result;
    }
    return null;
  }

  @override
  Future<bool> set<T>(String key, T value) {
    if (value is bool) {
      return _pref.setBool(key, value as bool);
    }
    if (value is int) {
      return _pref.setInt(key, value as int);
    }
    if (value is double) {
      return _pref.setDouble(key, value as double);
    }
    if (value is List) {
      return _pref.setStringList(
          key, (value as List).map((e) => e.toString()).toList());
    } else {
      return _pref.setString(key, value.toString());
    }
  }

  @override
  Future<bool> remove(String key) => _pref.remove(key);
}
