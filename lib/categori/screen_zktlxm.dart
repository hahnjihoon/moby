import 'package:flutter/material.dart';
import 'package:moby/html/screen_html_zktlxm.dart';
import 'package:moby/model/model_dbahck.dart'; //이렇게임포트시키고 클래스명으로 사용가능
import 'package:moby/model/model_zktlxm.dart';
import 'package:moby/product/screen_select_dbahck.dart';
import 'package:moby/html/screen_html_dbahck.dart';
import 'package:moby/product/screen_select_zktlxm.dart';

class ZktlxmScreen extends StatefulWidget {
  const ZktlxmScreen({super.key});

  @override
  _ZktlxmScreenState createState() => _ZktlxmScreenState();
}

class _ZktlxmScreenState extends State<ZktlxmScreen> {
  List<Zktlxm> products = [
    Zktlxm.fromMap({
      'id': 1,
      'majorClass': '출산/유아동',
      'middleClass': '카시트',
      'minorClass': '카시트',
      'imageUrl':
      'https://search.pstatic.net/common/?src=https%3A%2F%2Fsearchad-phinf.pstatic.net%2FMjAyNDAxMjJfMjU4%2FMDAxNzA1OTEyMjgyMTQ3.47d--vi9U8XJKGBu5jprLstgaUaHpW8vi1RgoeFTe4Ig.wL1XbGA3XgvTZ0dMskgcs1qHumATPqc4SAAIxMcGXXQg.PNG%2F2099309-f71d5f88-d766-4ad6-bd21-92f9b009a260.png&type=f300_300&quality=80',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '폭스5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 1100,
      'madeIn': '네덜란드',
      'weight': '10kg',
      'size': '80cm x 93cm x 105cm',
      'color': '-',
    }),
    Zktlxm.fromMap({
      'id': 1,
      'majorClass': '출산/유아동',
      'middleClass': '카시트',
      'minorClass': '카시트',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_2758588/27585889522.20230411105828.jpg?type=f300',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '폭스5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 1000,
      'madeIn': '네덜란드',
      'weight': '8kg',
      'size': '80cm x 93cm x 105cm',
      'color': '-',
    }),
    Zktlxm.fromMap({
      'id': 1,
      'majorClass': '출산/유아동',
      'middleClass': '카시트',
      'minorClass': '카시트',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_1850869/18508693861.20240118083709.jpg?type=f300',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '폭스5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 800,
      'madeIn': '네덜란드',
      'weight': '10.5kg',
      'size': '80cm x 93cm x 105cm',
      'color': '-',
    }),
    Zktlxm.fromMap({
      'id': 1,
      'majorClass': '출산/유아동',
      'middleClass': '카시트',
      'minorClass': '카시트',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_4145457/41454573621.20230811161923.jpg?type=f300',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '폭스5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 2000,
      'madeIn': '네덜란드',
      'weight': '20.2kg',
      'size': '80cm x 93cm x 105cm',
      'color': '-',
    }),

  ];

  late List<bool> isCheckedList;
  @override
  void initState() {
    super.initState();
    isCheckedList = List.filled(products.length, false);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('moby_zktlxm_list'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[


            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // 모든 상품을 선택 상태로 변경
                      for (int i = 0; i < isCheckedList.length; i++) {
                        isCheckedList[i] = true;
                      }
                    });
                  },
                  child: Text('전체 선택'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // 모든 상품을 선택 해제 상태로 변경
                      for (int i = 0; i < isCheckedList.length; i++) {
                        isCheckedList[i] = false;
                      }
                    });
                  },
                  child: Text('전체 해제'),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Expanded(
              //위row쓰고 나머지 꽉채우고싶을때 쓴다
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  Zktlxm product = products[index];
                  bool isChecked = isCheckedList[index];

                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedList[index] = value ?? false;
                            });
                          },
                        ),
                        SizedBox(width: 10), // 체크박스와 이미지 간격 조정
                        Container(
                          padding:
                          EdgeInsets.all(10), // 모든 측면에 대해 10의 패딩을 설정합니다.
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black, width: 2), // 검정 테두리 설정
                            borderRadius:
                            BorderRadius.circular(10), // 테두리를 둥글게 만들기 위한 설정
                          ),
                          child: Image.network(
                            product.imageUrl,
                            width: width * 0.4,
                          ),
                        ),
                        SizedBox(width: 10), // 이미지와 컨텐츠 간격 조정
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('소분류: ${product.minorClass}'),
                              Text('제품명: ${product.productName}'),
                              Text('브랜드: ${product.brand}'),
                              Text('판매업체: ${product.salesCom}'),
                              Text('가격: ${product.price}원'),
                              Text('제조국: ${product.madeIn}'),
                              Text('색상: ${product.color}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ]);
                },
              ),
            ),
            Container(
              padding:
              EdgeInsets.only(top: width * 0.036, bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      List<Zktlxm> checkedProducts = [];
                      for (int i = 0; i < isCheckedList.length; i++) {
                        if (isCheckedList[i]) {
                          checkedProducts.add(products[i]);
                        }
                      }
                      if (checkedProducts.length < 2) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('알림'),
                            content: const Text('2개 이상 선택하시오'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('확인'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectZktlxmScreen(
                              data: checkedProducts,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                    ),
                    child: const Text(
                      '월드컵비교',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      List<Zktlxm> checkedProducts = [];
                      for (int i = 0; i < isCheckedList.length; i++) {
                        if (isCheckedList[i]) {
                          checkedProducts.add(products[i]);
                        }
                      }
                      if (checkedProducts.length < 2) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('알림'),
                            content: const Text('2개 이상 선택하시오'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('확인'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.of(context).push(



                            MaterialPageRoute(builder: (context) => HtmlZktlxmScreen(data: checkedProducts,)));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                    ),
                    child: const Text(
                      '테이블비교',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
