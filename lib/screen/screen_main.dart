
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moby/common/rolling_banner.dart';

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
      // Navigator.popUntil(context, (route) => route.isFirst);
        SystemNavigator.pop();
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
                        content: Text("메뉴를 눌렀습니다.ㄴㅁㅇㄻㄴㅇㄹ"),
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
          content: Text("$searchText 로고를 눌렀습니다."),
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