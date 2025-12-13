import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_config.dart';

class ApiCaller {
  const ApiCaller();

  Future<Map<String, dynamic>?> get(String route) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.apiBaseUrl}$route'),
        headers: {'Content-Type': 'application/json'},
      );

      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> post(
      String route,
      Map<String, dynamic> body,
      ) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.apiBaseUrl}$route'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }
}

final ApiCaller apiCaller = ApiCaller();