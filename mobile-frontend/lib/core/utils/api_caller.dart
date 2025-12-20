import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants/app_config.dart';

class ApiCaller {
  const ApiCaller();

  Future<dynamic> get(String route) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$route');
    try {
      debugPrint('$url');
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      debugPrint('${response.statusCode}');
      debugPrint('${response.body}');
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return null;
      }

      return jsonDecode(response.body);
    } catch (e) {
      debugPrint('[API][GET] ERROR: $e');
      return null;
    }
  }

  Future<dynamic> post(String route, Map<String, dynamic> body) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$route');

    try {
      debugPrint('[API][POST] $url');
      debugPrint('[API][POST] payload=$body');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      debugPrint('[API][POST] status=${response.statusCode}');
      debugPrint('[API][POST] body=${response.body}');

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return null;
      }

      return jsonDecode(response.body);
    } catch (e) {
      debugPrint('[API][POST] ERROR: $e');
      return null;
    }
  }
}

final ApiCaller apiCaller = ApiCaller();