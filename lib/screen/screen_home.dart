import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart'; //이렇게임포트시키고 클래스명으로 사용가능
import 'package:moby/screen/screen_list.dart';
import 'package:moby/screen/screen_register.dart';
import 'package:moby/screen/screen_login.dart';
import 'package:moby/screen/screen_categori.dart';
import 'package:moby/screen/screen_verho.dart';
import 'package:moby/screen/screen_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        ),
      ),
    );
  }
}
