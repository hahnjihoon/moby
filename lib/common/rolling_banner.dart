import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RollingBanner extends StatefulWidget {
  @override
  _RollingBannerState createState() => _RollingBannerState();
}

class _RollingBannerState extends State<RollingBanner> {
  int _currentPage = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // 세로 길이 설정
      margin: EdgeInsets.symmetric(horizontal: 1), // 좌우 여백 설정
      child: CarouselSlider(
        items: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            color: Colors.blue,
            child: Center(child: Text('Page 1')),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            color: Colors.green,
            child: Center(child: Text('Page 2')),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            color: Colors.orange,
            child: Center(child: Text('Page 3')),
          ),
        ],
        options: CarouselOptions(
          onPageChanged: (index, _) {
            setState(() {
              _currentPage = index;
            });
          },
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 1), // 자동 슬라이딩 간격을 1초로 설정
          enlargeCenterPage: true,
          aspectRatio: 29 / 9,
          viewportFraction: 0.9,
          initialPage: _currentPage,
        ),
        carouselController: _controller,
      ),
    );
  }
}
