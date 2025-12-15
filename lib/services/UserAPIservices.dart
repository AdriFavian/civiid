import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';

final api_http = 'http://192.168.1.6:8080/api/v1/user/';

class TestApi {
  Future<bool> testApi() async {
    try {
      final response = await get(Uri.parse(api_http));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

class RegisterApi {
  Future<Map<String, dynamic>> registerApi(
    int nik,
    String name,
    String email,
    String password,
    String jenisKelamin,
    String tempatLahir,
    DateTime birthDate,
    String agama,
    String address,
    int phoneNumber,
    String status,
    File image,
  ) async {
    try {
      var request = MultipartRequest('POST', Uri.parse(api_http + 'register'));
      request.fields['nik'] = nik.toString();
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['jenis_kelamin'] = jenisKelamin;
      request.fields['tempat_lahir'] = tempatLahir;
      // Convert DateTime to ISO8601 string or backend expected format (yyyy-MM-dd)
      request.fields['birth_date'] = birthDate.toIso8601String().split('T')[0];
      request.fields['agama'] = agama;
      request.fields['address'] = address;
      request.fields['phone_number'] = phoneNumber.toString();
      request.fields['status'] = status;

      print("Trying to upload image from path: '${image.path}'");
      if (await image.exists()) {
        print("Image exists. Adding to request...");
        try {
          request.files.add(
            await MultipartFile.fromPath('photo_file', image.path),
          );
          print("Image added successfully.");
        } catch (fileError) {
          print("Error adding file: $fileError");
          return {'error': 'Error reading image file: $fileError'};
        }
      } else {
        print(
          "Image does not exist or path is empty. Proceeding without image.",
        );
      }

      print("Sending request to ${request.url}");
      final streamedResponse = await request.send();
      print("Response status: ${streamedResponse.statusCode}");
      final response = await Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        try {
          print(response.body);
          return jsonDecode(response.body);
        } catch (e) {
          return {
            'error': 'Failed to register. Status: ${response.statusCode}',
          };
        }
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}

class LoginAPI {
  Future<Map<String, dynamic>> loginApi(int nik, String password) async {
    try {
      final response = await post(
        Uri.parse(api_http + 'login'),
        body: {'nik': nik, 'password': password},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'error': 'Failed to login'};
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
