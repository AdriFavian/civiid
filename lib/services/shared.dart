import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String keyNik = 'register_nik';
  static const String keyName = 'register_name';
  static const String keyTempatLahir = 'register_tempat_lahir';
  static const String keyTanggalLahir = 'register_tanggal_lahir';
  static const String keyJenisKelamin = 'register_jenis_kelamin';
  static const String keyAlamat = 'register_alamat';
  static const String keyAgama = 'register_agama';
  static const String keyStatusPerkawinan = 'register_status_perkawinan';
  static const String keyImagePath = 'register_image_path';
  static const String keyEmail = 'register_email';
  static const String keyPassword = 'register_password';
  static const String keyPhone = 'register_phone';

  Future<void> saveRegisterData({
    String? nik,
    String? name,
    String? tempatLahir,
    String? tanggalLahir,
    String? jenisKelamin,
    String? alamat,
    String? agama,
    String? statusPerkawinan,
    String? imagePath,
    String? email,
    String? password,
    String? phone,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (nik != null) await prefs.setString(keyNik, nik);
    if (name != null) await prefs.setString(keyName, name);
    if (tempatLahir != null) await prefs.setString(keyTempatLahir, tempatLahir);
    if (tanggalLahir != null)
      await prefs.setString(keyTanggalLahir, tanggalLahir);
    if (jenisKelamin != null)
      await prefs.setString(keyJenisKelamin, jenisKelamin);
    if (alamat != null) await prefs.setString(keyAlamat, alamat);
    if (agama != null) await prefs.setString(keyAgama, agama);
    if (statusPerkawinan != null)
      await prefs.setString(keyStatusPerkawinan, statusPerkawinan);
    if (imagePath != null) await prefs.setString(keyImagePath, imagePath);
    if (email != null) await prefs.setString(keyEmail, email);
    if (password != null) await prefs.setString(keyPassword, password);
    if (phone != null) await prefs.setString(keyPhone, phone);
  }

  Future<Map<String, dynamic>> getRegisterData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'nik': prefs.getString(keyNik),
      'name': prefs.getString(keyName),
      'tempat_lahir': prefs.getString(keyTempatLahir),
      'tanggal_lahir': prefs.getString(keyTanggalLahir),
      'jenis_kelamin': prefs.getString(keyJenisKelamin),
      'alamat': prefs.getString(keyAlamat),
      'agama': prefs.getString(keyAgama),
      'status_perkawinan': prefs.getString(keyStatusPerkawinan),
      'image_path': prefs.getString(keyImagePath),
      'email': prefs.getString(keyEmail),
      'password': prefs.getString(keyPassword),
      'phone': prefs.getString(keyPhone),
    };
  }

  Future<void> clearRegisterData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyNik);
    await prefs.remove(keyName);
    await prefs.remove(keyTempatLahir);
    await prefs.remove(keyTanggalLahir);
    await prefs.remove(keyJenisKelamin);
    await prefs.remove(keyAlamat);
    await prefs.remove(keyAgama);
    await prefs.remove(keyStatusPerkawinan);
    await prefs.remove(keyImagePath);
    await prefs.remove(keyEmail);
    await prefs.remove(keyPassword);
    await prefs.remove(keyPhone);
  }
}
