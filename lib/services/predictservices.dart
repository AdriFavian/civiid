import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PredictService {
  final apiUrl = dotenv.env['API_PREDICT_URL'];

  Future<Map<String, dynamic>> predictGender(File image) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl!));
      final file = await http.MultipartFile.fromPath('file', image.path);
      request.files.add(file);

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);

      print(result);
      return result;
    } catch (e) {
      debugPrint('Error during prediction: $e');
      return {'error': 'Failed to predict gender'};
    }
  }
}
