import 'package:civiid/services/shared.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final api_http = dotenv.env['API_URL']! + 'admin/';

class LoginAdminAPI {
  Future<Map<String, dynamic>> loginApi(String email, String password) async {
    try {
      var request = MultipartRequest('POST', Uri.parse(api_http + 'login'));
      request.fields['email'] = email;
      request.fields['password'] = password;
      final streamedResponse = await request.send();
      final response = await Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        SharedPrefServiceLogin().saveLoginData(
          token: data['data']['access_token'],
        );
        return data;
      } else {
        final data = jsonDecode(response.body);
        if (data['message'] != null) {
          return {'error': data['message']};
        }
        return {'error': 'Failed to login'};
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}

class QRScanAPI {
  Future<Map<String, dynamic>> scanQrApi(String code) async {
    try {
      var request = MultipartRequest('POST', Uri.parse(api_http + 'scan-qr'));
      String token = await SharedPrefServiceLogin().getLoginData();
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['qr_token'] = code;
      final streamedResponse = await request.send();
      final response = await Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        return {'error': 'Failed to scan'};
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
