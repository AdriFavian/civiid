import 'package:civiid/Layout/data/login_info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServiceRegister {
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
  static const String keyAlasan = 'register_alasan';

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
    String? alasan_register,
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
    if (alasan_register != null)
      await prefs.setString(keyAlasan, alasan_register);
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
      'alasan_register': prefs.getString(keyAlasan),
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
    await prefs.remove(keyAlasan);
  }
}

class SharedPrefServiceLogin extends ChangeNotifier {
  Future<LoginInfo> checkLogin() async {
    LoginInfo loginInfo = await LoginInfo.getFromSharedPreference();
    return loginInfo;
  }

  Future<void> saveLoginData({String? token, bool? petugas}) async {
    LoginInfo loginInfo = await LoginInfo.getFromSharedPreference();
    loginInfo.isLoggedIn = true;
    if (petugas != null) {
      loginInfo.petugas = petugas;
    }
    if (token != null) {
      loginInfo.authToken = token;
    }
    await loginInfo.saveToSharedPreference();
  }

  Future<void> clearLoginData() async {
    LoginInfo loginInfo = await LoginInfo.getFromSharedPreference();
    loginInfo.isLoggedIn = false;
    loginInfo.authToken = '';
    loginInfo.petugas = false;
    await loginInfo.saveToSharedPreference();
  }

  Future<String> getLoginData() async {
    LoginInfo loginInfo = await LoginInfo.getFromSharedPreference();
    return loginInfo.authToken;
  }
}
