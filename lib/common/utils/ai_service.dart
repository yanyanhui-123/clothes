import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {

  static const apiKey = "sk-SlsqmvHtlKJSW8mzWm5OVd8a1a0Q6XZyMxw13KMf0x2YRg3z";

  static Future<String> chat(String message) async {

    final response = await http.post(
      Uri.parse("https://api.moonshot.cn/v1/chat/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
      body: jsonEncode({
        "model": "kimi-k2-0905-preview",
        "messages": [
          {"role": "user", "content": message}
        ]
      }),
    );

    final data = jsonDecode(response.body);
    print("data $data");

    return data["choices"][0]["message"]["content"];
  }
}