// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moby/screen/screen_home.dart';

// import 'package:flutter_memo_app/header&footer.dart';
// import 'package:flutter_memo_app/loginPage/loginDB.dart';
// import 'package:flutter_memo_app/loginPage/memberRegisterPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// 로그인 페이지
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  int _selectedIndex = 0; // BottomNavigationBar의 선택된 인덱스
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    print('선택된 인덱스: $index');

    switch (index) {
      case 1:
      Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
        break;
      case 2:
      // 핸드폰 바탕 화면으로 나가는 동작 수행
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 3:
      // 바로 이전 페이지로 돌아가는 동작 수행
        Navigator.pop(context);
        break;

      default:
        break;
    }
  }

  // 자동 로그인 여부
  bool switchValue = false;

  // 아이디와 비밀번호 정보
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('moby'),
          backgroundColor: Colors.deepPurple,
          // leading: Container(),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ID 입력 텍스트필드
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: CupertinoTextField(
                      controller: userIdController,
                      placeholder: '아이디를 입력해주세요',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // 비밀번호 입력 텍스트필드
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: CupertinoTextField(
                      controller: passwordController,
                      placeholder: '비밀번호를 입력해주세요',
                      textAlign: TextAlign.center,
                      obscureText: true,
                    ),
                  ),
                ),
                // 자동 로그인 확인 토글 스위치
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '자동로그인 ',
                        style: TextStyle(
                            color: CupertinoColors.activeBlue,
                            fontWeight: FontWeight.bold),
                      ),
                      CupertinoSwitch(
                        // 부울 값으로 스위치 토글 (value)
                        value: switchValue,
                        activeColor: CupertinoColors.activeBlue,
                        onChanged: (bool? value) {
                          // 스위치가 토글될 때 실행될 코드
                          setState(() {
                            switchValue = value ?? false;
                          });
                        },
                      ),
                      Text('    '),
                      // 계정 생성 페이지로 이동하는 버튼
                      OutlinedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MemberRegisterPage(),
                          //   ),
                          // );
                        },
                        child: Text(
                          '계정생성',
                        ),
                      ),
                    ],
                  ),
                ),
                // 로그인 버튼
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        final loginCheck = -1;
                        // await login(
                        //     userIdController.text, passwordController.text);
                        // print(loginCheck);

                        // 로그인 확인
                        if (loginCheck == -1) {
                          print('로그인 실패');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('알림'),
                                content: Text('기능개발중'),
                                actions: [
                                  TextButton(
                                    child: Text('닫기'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          print('로그인 성공');

                          // 메인 페이지로 이동
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MyAppPage(),
                          //   ),
                          // );
                        }
                      },
                      child: Text('로그인'),
                    ),
                  ),
                ),
              ],
            ),
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
              icon: Icon(Icons.exit_to_app),
              label: 'Exit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: 'Back',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
