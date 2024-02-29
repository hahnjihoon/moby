import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  // const MyWebView({super.key});
  const MyWebView({Key? key}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  // 웹뷰 컨트롤러 인스턴스 생성
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // 보여줄 페이지 URL
    _controller = WebViewController()
      ..loadRequest(Uri.parse('https://luvris2.tistory.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Example'),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}