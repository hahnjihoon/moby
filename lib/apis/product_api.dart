import 'dart:async';

import 'base_url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future getProductsData(String? category) async {
  final Uri url = Uri.parse('$BASE_URL/products?category=$category');

  try {
    final response = await http.get(url,
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });

    if (response.statusCode == 200) {
      // 서버에서 제공하는 데이터는 response.body에 포함됩니다.
      print('서버에서 받은 데이터: ${response.body}');
      return json.decode(response.body);
    } else {
      print('서버 응답 실패: ${response.statusCode}');
      throw Exception('Failed to load data from backend');
    }
  } catch (e) {
    print('에러 발생: $e');
    return null; // 에러 발생 시 null 반환
  }
}


Future<Map<String, dynamic>> getProductsData2() async {
  final response = await http.get(Uri.parse('$BASE_URL/products'),
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*", // 수정된 부분
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept" // 추가된 부분
      });
  if (response.statusCode == 200) {
    print('서버에서 받은 데이터: ${response.body}');
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data from backend');
  }
}