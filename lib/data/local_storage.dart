import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final _storageUtil = LocalStorage._();

  static late SharedPreferences _preferences;

  factory LocalStorage() {
    return _storageUtil.._init();
  }

  LocalStorage._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setIsFirst(bool status) async {
    return await _preferences.setBool('is_first', status);
  }

  bool getIsFirst() {
    return _preferences.getBool('is_first') ?? false;
  }

  Future<bool> setIsProfile(bool status) async {
    return await _preferences.setBool('is_profile', status);
  }

  bool getIsProfile() {
    return _preferences.getBool('is_profile') ?? false;
  }

  Future<bool> setIsLogin(bool status) async {
    return await _preferences.setBool('is_login', status);
  }

  bool getIsLogin() {
    return _preferences.getBool('is_login') ?? false;
  }

  Future<bool> setToken(String token) async {
    return await _preferences.setString('token', token);
  }

  String getToken() {
    return _preferences.getString('token') ?? '';
  }

  Future<bool> setPhone(String token) async {
    return await _preferences.setString('phone', token);
  }

  String getPhone() {
    return _preferences.getString('phone') ?? '';
  }

  Future<bool> setLanguage(String language) async {
    return await _preferences.setString('language', language);
  }

  String getLanguage() {
    return _preferences.getString('language') ?? '';
  }

  Future<bool> setLocalPassword(String localPassword) async {
    return await _preferences.setString('local_password', localPassword);
  }

  String getLocalPassword() {
    return _preferences.getString('local_password') ?? '';
  }

  Future<bool> setUserId(int id) async {
    return await _preferences.setInt('user_id', id);
  }

  int getUserId() {
    return _preferences.getInt('user_id') ?? 0;
  }

  Future<bool> setHistoryId(int id) async {
    return await _preferences.setInt('history_id', id);
  }

  int getHistoryId() {
    return _preferences.getInt('history_id') ?? 0;
  }
}
