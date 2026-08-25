import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // 10.0.2.2 is the Android emulator's alias for the host machine's localhost.
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  Future<String> transcribe(String audioFilePath) async {
    final uri = Uri.parse('$baseUrl/transcribe');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('audio', audioFilePath));

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);

    if (response.statusCode != 200) {
      throw Exception('Transcribe failed: ${response.body}');
    }
    final data = jsonDecode(response.body);
    return data['text'] as String;
  }

  Future<Map<String, dynamic>> extractTasks(String text) async {
    final uri = Uri.parse('$baseUrl/extract');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}),
    );

    if (response.statusCode != 200) {
      throw Exception('Extract failed: ${response.body}');
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
