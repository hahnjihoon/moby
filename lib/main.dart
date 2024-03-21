import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moby/screen/screen_home.dart';
import 'package:moby/screen/screen_main.dart';


void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  // FlutterNativeSplash.remove();
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

//기존메인화면
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       scrollBehavior: MyCustomScrollBehavior(),
//       title: 'Moby1.2',
//       home: const Scaffold(
//         body: HomeScreen(),
//         // bottomNavigationBar: BottomNavigationBar(
//         //   type: BottomNavigationBarType.fixed,
//         //   // currentIndex: 2,
//         //   items: const [
//         //     BottomNavigationBarItem(icon: Icon(Icons.home), label:'home'),
//         //     BottomNavigationBarItem(icon: Icon(Icons.exit_to_app),
//         //       label: 'Exit',),
//         //     BottomNavigationBarItem(icon: Icon(Icons.arrow_back),
//         //       label: 'Back',),
//         //   ],
//         // ),
//       )
//     );
//   }
// }

//스플래쉬추가화면
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Moby1.2',
      home: SplashScreen(), // 스플래시 화면을 첫 화면으로 설정
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 일정 시간이 지난 후에 메인 화면으로 이동하는 함수
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // 여기에 스플래시 화면에 표시할 위젯을 추가하세요 (예: 이미지)
        child: Image.asset('images/splash.gif'),
      ),
    );
  }
}