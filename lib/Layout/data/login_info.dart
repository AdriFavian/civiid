import 'package:shared_preferences/shared_preferences.dart';

class LoginInfo {
  String authToken;
  bool isLoggedIn;
  bool petugas;

  LoginInfo({
    required this.authToken,
    this.isLoggedIn = false,
    this.petugas = false,
  });

  Future<void> saveToSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', authToken);
    prefs.setBool('isLoggedIn', isLoggedIn);
    prefs.setBool('petugas', petugas);
  }

  static Future<LoginInfo> getFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken') ?? '';
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final petugas = prefs.getBool('petugas') ?? false;
    return LoginInfo(
      authToken: authToken,
      isLoggedIn: isLoggedIn,
      petugas: petugas,
    );
  }

  static Future<void> deleteFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
    prefs.remove('isLoggedIn');
  }
}
