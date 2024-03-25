import 'base_url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

_postRequest() async {
  final Uri url = Uri.parse('$BASE_URL/products');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // 서버에서 제공하는 데이터는 response.body에 포함됩니다.
      print('서버에서 받은 데이터: ${response.body}');

      // 만약 JSON 형식의 데이터라면 다음과 같이 해독할 수 있습니다.
      final jsonData = jsonDecode(response.body);
      // jsonData를 사용하여 추가적인 처리를 수행할 수 있습니다.
    } else {
      print('서버 응답 실패: ${response.statusCode}');
    }
  } catch (e) {
    print('에러 발생: $e');
  }
}