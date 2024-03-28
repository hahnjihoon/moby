
import 'package:flutter/material.dart';
import 'package:moby/common/rolling_banner.dart';
import 'screen_categori.dart';
import 'screen_productlist.dart';
import 'package:moby/categori/screen_zktlxm.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  _MainScreenState createState()=> _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int _selectedIndex = 0; // 바텀바의 초기 선택 인덱스
  String _searchText = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    print('선택된 인덱스: $index');
    // Navigator.of(context).pop(true)  //페이지 제거
    // 2. SystemNavigator.pop() // 앱 종료
    // 3. exit(0) //강제종료

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriScreen()),
        );
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {
                // _showAlertDialog(context);
              },
              child: Image.asset('images/logo.png', width: 40, height: 40), // 왼쪽에 로고 이미지
            ),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(
                icon: const Icon(Icons.menu), // 오른쪽에 메뉴 아이콘
                iconSize: 40, // 아이콘 크기 조절
                onPressed: () {
                  // 메뉴 버튼이 클릭되었을 때의 동작
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("알림"),
                        content: Text("메뉴를 눌렀습니다."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("확인"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                        onTap: () {
                          _showAlertDialog(context, _searchText);
                        },
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                RollingBanner(),
                SizedBox(height: 30), // 추가된 간격
                Text(
                  '카테고리 선택',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // 추가된 간격
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백 추가
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductlistScreen(category: '유모차')),
                            );
                          },
                          // child: Text('유모차'),
                          child: Image.asset('images/1111.png'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 250), // 높이를 100으로 설정
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10), // 좌측 상단 둥근 모서리
                                bottomLeft: Radius.circular(10), // 좌측 하단 둥근 모서리
                                topRight: Radius.circular(10), // 우측 상단 모서리는 네모낳게 유지
                                bottomRight: Radius.circular(10), // 우측 하단 모서리는 네모낳게 유지
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // 버튼 간의 간격 조절
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductlistScreen(category: '카시트')),
                            );
                          },
                          // child: Text('카시트'),
                            child: Image.asset('images/zktlxm.png'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 250), // 높이를 100으로 설정
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10), // 좌측 상단 둥근 모서리
                                bottomLeft: Radius.circular(10), // 좌측 하단 둥근 모서리
                                topRight: Radius.circular(10), // 우측 상단 모서리는 네모낳게 유지
                                bottomRight: Radius.circular(10), // 우측 하단 모서리는 네모낳게 유지
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 패딩 추가
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), // 검정색 테두리 적용
                      borderRadius: BorderRadius.circular(10), // 테두리 둥글기 설정
                    ),
                    width: double.infinity, // 부모 위젯의 너비에 맞게 컨테이너를 확장
                    height: 130, // 높이를 100으로 설정
                    child: Center(
                      child: Text(
                        '푸터영역\n이용약관  개인정보 처리방침 \n (주)모비 서울시성북구삼선동 코오롱본관 \n 01055520440',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Mypage',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }


  void _search() {
    // 여기서 _searchText를 사용하여 검색 동작을 수행합니다.
    print('검색어: $_searchText');
    // 예를 들어, 검색 결과를 출력하거나 네트워크 요청을 보낼 수 있습니다.
  }

  void _showAlertDialog(BuildContext context, String searchText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("알림"),
          content: Text("$searchText 검색을 눌렀습니다."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); //현재화면을 닫고 이전화면으로 돌아감
              },
              child: Text("확인"),
            ),
          ],
        );
      },
    );
  }






}