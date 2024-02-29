import 'package:flutter/material.dart';
import 'package:moby/categori/screen_dbahck.dart';
import 'package:moby/categori/screen_wjwqud.dart';
import 'package:moby/categori/screen_zktlxm.dart';
import 'package:moby/categori/screen_clarnfb.dart';
import 'package:moby/categori/screen_rlwjrnl.dart';
import 'package:moby/categori/screen_dldbtlr.dart';

class CategoriScreen extends StatefulWidget {
  const CategoriScreen({Key? key}) : super(key: key);

  @override
  _CategoriScreenState createState() => _CategoriScreenState();
}

class _CategoriScreenState extends State<CategoriScreen> {
  List<String> products = ['유모차', '젖병', '카시트', '침구류', '기저귀', '이유식'];
  List<String> imageloca = ['images/1111.png', 'images/wjwqud.png', 'images/zktlxm.png', 'images/clarn.jpg', 'images/rlwjrl.jpg', 'images/dldb.jpg'];
  List<String> gopage = ['DbahckScreen', 'WjwqudScreen','ZktlxmScreen', 'ClarnfbScreen','RlwjrnlScreen', 'DldbtlrScreen'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('moby_categori'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                for (int i = 0; i < products.length; i += 3)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildElevatedButton(i),
                          if (i + 1 < products.length) buildElevatedButton(i + 1),
                          if (i + 2 < products.length) buildElevatedButton(i + 2),
                        ],
                      ),
                      SizedBox(height: 20), // 행 사이 간격 조절
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(int index) {
    return ElevatedButton(
      onPressed: () {
        // 버튼이 눌렸을 때 수행할 작업
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => getPageWidget(gopage[index]),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // 내부 패딩 제거
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 버튼을 둥글게 만들기 위한 설정
          side: BorderSide(color: Colors.black, width: 2), // 테두리 설정
        ),
        elevation: 0, // 그림자 제거
        minimumSize: const Size(100, 100), // 버튼의 최소 크기 설정
        alignment: Alignment.center, // 내부 요소를 가운데 정렬
        backgroundColor: Colors.transparent, // 배경색 투명 설정
      ),
      child: Container(
        width: 100, // 버튼 너비
        height: 100, // 버튼 높이
        decoration: imageloca[index].isEmpty
            ? null // 공백일 경우 이미지를 표시하지 않음
            : BoxDecoration(
          borderRadius: BorderRadius.circular(10), // 이미지를 둥글게 만들기 위한 설정
          image: DecorationImage(
            image: AssetImage(imageloca[index]), // 이미지 경로 설정
            fit: BoxFit.cover, // 이미지가 버튼 영역을 채우도록 설정
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          products[index],
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey, // 텍스트의 색상을 빨간색으로 설정
          ),
        ),
      ),
    );
  }


  Widget getPageWidget(String pageName) {
    // 페이지 이름에 따라 해당하는 위젯을 반환합니다.
    switch (pageName) {
      case 'DbahckScreen':
        return DbahckScreen();
      case 'WjwqudScreen':
        return WjwqudScreen();
      case 'ZktlxmScreen':
        return ZktlxmScreen();
      case 'ClarnfbScreen':
        return ClarnfbScreen();
      case 'RlwjrnlScreen':
        return RlwjrnlScreen();
      case 'DldbtlrScreen':
        return DldbtlrScreen();
      default:
      // 기본적으로는 ListScreen을 반환합니다.
        return DbahckScreen();
    }
  }

}

