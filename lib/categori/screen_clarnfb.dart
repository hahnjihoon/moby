import 'package:flutter/material.dart';
import 'package:moby/html/screen_html_clarnfb.dart';
import 'package:moby/model/model_clarnfb.dart';

import '../product/screen_select_clarnfb.dart';

class ClarnfbScreen extends StatefulWidget {
  const ClarnfbScreen({super.key});

  @override
  _ClarnfbScreenState createState() => _ClarnfbScreenState();
}

class _ClarnfbScreenState extends State<ClarnfbScreen> {
  List<Clarnfb> products = [
    Clarnfb.fromMap({
      'id': 1,
      'majorClass': '출산/유아동',
      'middleClass': '침구류',
      'minorClass': '이불',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_3412315/34123159618.20220818171037.jpg?type=f300',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '이불5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 90000,
      'madeIn': '네덜란드',
      'weight': '1.2kg',
      'size': '80cm x 93cm',
      'color': '화이트',
    }),
    Clarnfb.fromMap({
      'id': 2,
      'majorClass': '출산/유아동',
      'middleClass': '침구류',
      'minorClass': '침대',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_8570109/85701096201.1.jpg?type=f300',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '폭스5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 11000,
      'madeIn': '네덜란드',
      'weight': '2.1kg',
      'size': '80cm x 93cm x 93cm',
      'color': '-',
    }),
    Clarnfb.fromMap({
      'id': 3,
      'majorClass': '출산/유아동',
      'middleClass': '침구류',
      'minorClass': '이불',
      'imageUrl':
      'https://shopping-phinf.pstatic.net/main_8280763/82807630074.7.jpg?type=f300',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '폭스5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 8000,
      'madeIn': '네덜란드',
      'weight': '0.5kg',
      'size': '80cm x 93cm',
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
          title: Text('moby_clarnfb_list'),
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
                  Clarnfb product = products[index];
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
                      List<Clarnfb> checkedProducts = [];
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
                            builder: (context) => SelectClarnfbScreen(
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
                      List<Clarnfb> checkedProducts = [];
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



                            MaterialPageRoute(builder: (context) => HtmlClarnfbScreen(data: checkedProducts,)));
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
