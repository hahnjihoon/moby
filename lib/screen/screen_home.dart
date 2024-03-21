import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moby/model/model_dbahck.dart'; //이렇게임포트시키고 클래스명으로 사용가능
import 'package:moby/categori/screen_dbahck.dart';
import 'package:moby/screen/screen_register.dart';
import 'package:moby/screen/screen_login.dart';
import 'package:moby/screen/screen_categori.dart';
import 'package:moby/zone/screen_verho.dart';
import 'package:moby/product/screen_select_dbahck.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // 바텀바의 초기 선택 인덱스
  DateTime? currentBackPressTime;

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
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          final msg = "더이상 뒤로갈수 없다.";
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                msg),
                duration: Duration(seconds: 3),

              )

            );
        } else {
          // 앱 종료
          Navigator.popUntil(context, (route) => route.isFirst);
        }

        break;
      default:
        break;
    }

  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('moby'),
            backgroundColor: Colors.deepPurple,
            // leading: Container(),
          ),
          body: Center(
            child: Container(
              // 화면 너비의 80%로 설정
              height: height * 0.9,
              width: width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.blue), // 2px 테두리 추가, 색상은 파란색
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1), // 상단에 여백 추가
                    child: Image.asset('images/logo.png'),
                  ),
                  SizedBox(height: height * 0.18), // 이미지 아래에 여백 추가
                  ElevatedButton(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       title: Text("알림"),
                      //       content: Text("기능개발중"),
                      //       actions: <Widget>[
                      //         TextButton(
                      //           onPressed: () {
                      //             Navigator.of(context).pop();
                      //           },
                      //           child: Text("확인"),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                          Size(width * 0.4, 50)), // 버튼의 가로 길이와 높이를 설정
                    ),
                    child: Text('로그인'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       title: Text("알림"),
                      //       content: Text("기능개발중"),
                      //       actions: <Widget>[
                      //         TextButton(
                      //           onPressed: () {
                      //             Navigator.of(context).pop();
                      //           },
                      //           child: Text("확인"),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                          Size(width * 0.4, 50)), // 버튼의 가로 길이와 높이를 설정
                    ),
                    child: Text('회원가입'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoriScreen()));
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                          Size(width * 0.4, 50)), // 버튼의 가로 길이와 높이를 설정
                    ),
                    child: Text('게스트입장'),
                  ),
                  // SizedBox(height: 15),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => VerhoScreen(
                  //             )));
                  //
                  //   },
                  //   style: ButtonStyle(
                  //     fixedSize: MaterialStateProperty.all(Size(width * 0.4, 50)), // 버튼의 가로 길이와 높이를 설정
                  //   ),
                  //   child: Text('수직수평'),
                  //
                  // ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // currentIndex: 2,
            items: const <BottomNavigationBarItem>[

              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app),
                label: 'Exit',
              ),
              BottomNavigationBarItem(

                icon: Icon(Icons.arrow_back),
                label: 'Back',
              ),
            ],
            currentIndex: _selectedIndex,
            // selectedItemColor: Colors.amber[800],
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: '뒤로 버튼을 한 번 더 누르면 종료됩니다.',
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.blue,
    fontSize: 16.0,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}


void showsnack(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '뒤로 버튼을 한 번 더 누르면 종료됩니다.',
        textAlign: TextAlign.center,
      ),
    ),
  );
}