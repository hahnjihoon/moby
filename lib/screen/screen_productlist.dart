import 'package:flutter/material.dart';
import 'package:moby/screen/screen_main.dart';
import 'package:moby/screen/screen_categori.dart';
import 'package:moby/apis/product_api.dart';

class ProductlistScreen extends StatefulWidget{
  // const ProductlistScreen({super.key});

  final String category;

  const ProductlistScreen({required this.category, Key? key}) : super(key: key);


  @override
  _ProductlistScreenState createState()=> _ProductlistScreenState();
}

class _ProductlistScreenState extends State<ProductlistScreen>{
  @override
  void initState() {
    super.initState();
    print('받은 카테고리: ${widget.category}');

  }

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
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

  int _selectedIndex = 1; // 바텀바의 초기 선택 인덱스

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.deepPurple, // 딥퍼플 배경색
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      widget.category,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(), // 텍스트빼고 나머지 다 빈공간추가하는코드
                    Image.asset(
                      'images/car1.png', // 이미지 경로
                      width: 40, // 이미지 너비 조절
                      height: 40, // 이미지 높이 조절
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
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
                              '구매가이드',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 220,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('제품 이고모르'),
                              ),
                            ),
                            SizedBox(width: 10), // B 사이 간격 조정
                            SizedBox(width: 48, height: 36),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('질서'),
                              ),
                            ),
                            SizedBox(width: 10), // B 사이 간격 조정
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('정렬'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10), // 버튼과 B 사이 간격 조정
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('B 4'),
                              ),
                            ),
                            SizedBox(width: 10), // B 사이 간격 조정
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('B 5'),
                              ),
                            ),
                            SizedBox(width: 10), // B 사이 간격 조정
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('B 6'),
                              ),
                            ),
                            SizedBox(width: 10), // B 사이 간격 조정
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('B 7'),
                              ),
                            ),
                            SizedBox(width: 10), // B 사이 간격 조정
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('B 8'),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ]
                  )
                ),
              ),

            ],
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
}