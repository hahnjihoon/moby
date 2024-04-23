import 'package:flutter/material.dart';
import 'package:moby/html/screen_html_wjwqud.dart';
import 'package:moby/model/model_dbahck.dart'; //이렇게임포트시키고 클래스명으로 사용가능
import 'package:moby/model/model_wjwqud.dart';
import 'package:moby/product/screen_select_wjwqud.dart';
import 'package:moby/html/screen_html_dbahck.dart';

class WjwqudScreen extends StatefulWidget {
  const WjwqudScreen({super.key});

  @override
  _WjwqudScreenState createState() => _WjwqudScreenState();
}

class _WjwqudScreenState extends State<WjwqudScreen> {
  List<Wjwqud> products = [
    Wjwqud.fromMap({
      'id': 1,
      'majorClass': '출산/유아동',
      'middleClass': '젖병',
      'minorClass': '젖병',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_8374974/83749749128.16.jpg?type=f300',
      'pageUrl': 'https://smartstore.naver.com/babysong/products/6205249551',
      'productName': '젖병1',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 100,
      'madeIn': '네덜란드',
      'material': '플라스틱',
      'weight': '1kg',
      'size': '10cm',
      'color': '-',
    }),
    Wjwqud.fromMap({
      'id': 2,
      'majorClass': '출산/유아동',
      'middleClass': '젖병',
      'minorClass': '젖병',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_8371870/83718702799.2.jpg?type=f300',
      'pageUrl': 'https://smartstore.naver.com/lansinoh/products/6174203222',
      'productName': '플러스2',
      'brand': '줄즈',
      'salesCom': '엔픽스',
      'price': 90,
      'madeIn': '네덜란드',
      'material': '쁘라스틱',
      'weight': '4kg',
      'size': '25cm',
      'color': '-',
    }),
    Wjwqud.fromMap({
      'id': 3,
      'majorClass': '출산/유아동',
      'middleClass': '젖병',
      'minorClass': '젖병',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_8579348/85793480484.jpg?type=f300',
      'pageUrl': 'https://brand.naver.com/doubleheart/products/8248980161',
      'productName': '솔로',
      'brand': '리안',
      'salesCom': '에이원베이비',
      'price': 110,
      'madeIn': '대한민국',
      'material': '알루미늄',
      'weight': '2.3kg',
      'size': '13cm',
      'color': '내추럴베이지',
    }),
    Wjwqud.fromMap({
      'id': 4,
      'majorClass': '출산/유아동',
      'middleClass': '젖병',
      'minorClass': '젖병',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_8302316/83023162316.7.jpg?type=f300',
      'pageUrl': 'https://smartstore.naver.com/joyfulnow/products/5478667557',
      'productName': '비66',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 40,
      'madeIn': '네덜란드',
      'material': '-',
      'weight': '5kg',
      'size': '53cm',
      'color': '껌정색',
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
          // title: Text('moby'),
          // backgroundColor: Colors.deepPurple,
          // leading: Container(),
          title: Text('moby_wjwqud_list'),
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
                  Wjwqud product = products[index];
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
                        // Image.asset(
                        //   'images/car${index + 1}.png',
                        //   width: width * 0.2,
                        // ),
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
                          // padding: EdgeInsets.all(8.0),
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.grey),
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text('ID: ${product.id}'),
                              // Text('대분류: ${product.majorClass}'),
                              // Text('중분류: ${product.middleClass}'),
                              Text('소분류: ${product.minorClass}'),
                              // Text('이미지 URL: ${product.imageUrl}'),
                              // Text('페이지 URL: ${product.pageUrl}'),
                              Text('제품명: ${product.productName}'),
                              Text('브랜드: ${product.brand}'),
                              Text('판매업체: ${product.salesCom}'),
                              Text('가격: ${product.price}원'),
                              Text('제조국: ${product.madeIn}'),
                              // Text('향신료: ${product.spices}'),
                              // Text('접이식 여부: ${product.folding}'),
                              // Text('재료: ${product.material}'),
                              // Text('무게: ${product.weight}'),
                              // Text('천장: ${product.ceiling}'),
                              // Text('휠: ${product.wheel}'),
                              // Text('크기: ${product.size}'),
                              // Text('바구니 크기: ${product.busketSize}'),
                              // Text('벨트: ${product.belt}'),
                              // Text('사용 제한 나이: ${product.lmtAge}'),
                              // Text('사용 제한 무게: ${product.lmtWet}'),
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
                      List<Wjwqud> checkedProducts = [];
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
                            builder: (context) => SelectWjwqudScreen(
                              data: checkedProducts,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text(
                      '월드컵비교',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            // Container(padding: EdgeInsets.only(bottom: width * 0.036),
            //   child: Center(
            //     child: ButtonTheme(
            //       minWidth: width * 0.8,
            //       height: height * 0.05,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: ElevatedButton(
            //         onPressed: () {
            //                Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => DropDownListExample(
            //
            //                 ),
            //               ),
            //             );
            //           },
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.deepPurple,
            //           onPrimary: Colors.white,
            //         ),
            //         child: const Text(
            //           '예시',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ),
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
                      List<Wjwqud> checkedProducts = [];
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



                            MaterialPageRoute(builder: (context) => HtmlWjwqudScreen(data: checkedProducts,)));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
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
