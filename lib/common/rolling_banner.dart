import 'dart:async';
import 'package:flutter/material.dart';

class RollingBanner extends StatefulWidget {
  @override
  _RollingBannerState createState() => _RollingBannerState();
}

class _RollingBannerState extends State<RollingBanner> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // 타이머를 사용하여 페이지 자동 슬라이딩
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _currentPage++; // 다음 페이지로 이동
      if (_currentPage >= 3) {
        _currentPage = 0; // 마지막 페이지인 경우 첫 번째 페이지로 이동
        _pageController.jumpToPage(0); // 페이지를 첫 번째 페이지로 이동
      } else {
        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut); // 다음 페이지로 이동
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // 세로 길이 설정
      margin: EdgeInsets.symmetric(horizontal: 13), // 좌우 여백 설정
      child: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4), // 페이지 간 여백 조절
            color: Colors.blue,
            child: Center(child: Text('Page 1')),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4), // 페이지 간 여백 조절
            color: Colors.green,
            child: Center(child: Text('Page 2')),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4), // 페이지 간 여백 조절
            color: Colors.orange,
            child: Center(child: Text('Page 3')),
          ),
        ],
      ),
    );
  }
}
