import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart'; //이렇게임포트시키고 클래스명으로 사용가능
import 'package:moby/screen/screen_product.dart';
import 'package:moby/screen/dropdown_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Product> products = [
    Product.fromMap({
      'id': 1,
      'majorClass': '출산/유아동',
      'middleClass': '유모차/웨건',
      'minorClass': '유모차',
      'imageUrl': 'https://shopping-phinf.pstatic.net/main_3931792/39317924618.20230411161640.jpg?type=f640',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/8040740850',
      'productName': '폭스5',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 50,
      'madeIn': '네덜란드',
      'spices': '디럭스형',
      'folding': '',
      'material': '바이오 플라스틱',
      'weight': '',
      'ceiling': '',
      'wheel': '',
      'size': '80cm x 93cm x 105cm',
      'busketSize': '39L',
      'belt': '5점식',
      'lmtAge': '',
      'lmtWet': '',
      'color': '',
    }),
    Product.fromMap({
      'id': 2,
      'majorClass': '출산/유아동',
      'middleClass': '유모차/웨건',
      'minorClass': '유모차',
      'imageUrl': 'https://shopping-phinf.pstatic.net/main_3107925/31079250618.20220225171654.jpg?type=f640',
      'pageUrl': 'https://smartstore.naver.com/enfix/products/5621952254',
      'productName': '허브플러스',
      'brand': '줄즈',
      'salesCom': '엔픽스',
      'price': 20,
      'madeIn': '네덜란드',
      'spices': '절충형',
      'folding': '',
      'material': '',
      'weight': '10kg',
      'ceiling': '',
      'wheel': '',
      'size': '53cm x 97cm x 105cm',
      'busketSize': '',
      'belt': '',
      'lmtAge': '4세',
      'lmtWet': '22kg',
      'color': '',
    }),
    Product.fromMap({
      'id': 3,
      'majorClass': '출산/유아동',
      'middleClass': '유모차/웨건',
      'minorClass': '유모차',
      'imageUrl': 'https://shopping-phinf.pstatic.net/main_3928826/39288266618.20230410164010.jpg?type=f640',
      'pageUrl': 'https://aonebaby.co.kr/product/detail.html?product_no=1582',
      'productName': '솔로',
      'brand': '리안',
      'salesCom': '에이원베이비',
      'price': 10,
      'madeIn': '대한민국',
      'spices': '절충형',
      'folding': '원터치',
      'material': '알루미늄',
      'weight': '12.9kg',
      'ceiling': '',
      'wheel': '지름 25cm, 6.5cm 서스펜션',
      'size': '50cm x 85cm x 103cm',
      'busketSize': '',
      'belt': '',
      'lmtAge': '3세',
      'lmtWet': '15kg',
      'color': '내추럴베이지, 모던그레이, 프렌치네이비',
    }),
    Product.fromMap({
      'id': 4,
      'majorClass': '출산/유아동',
      'middleClass': '유모차/웨건',
      'minorClass': '유모차',
      'imageUrl': 'https://shopping-phinf.pstatic.net/main_2632218/26322182522.20210722153930.jpg?type=f640',
      'pageUrl': 'https://brand.naver.com/bugabookorea/products/5914466695',
      'productName': '비6',
      'brand': '부가부',
      'salesCom': '부가부',
      'price': 40,
      'madeIn': '네덜란드',
      'spices': '절충형',
      'folding': '원터치',
      'material': '',
      'weight': '5.2kg',
      'ceiling': '확장형(3단계), UPF50+, 생활방수',
      'wheel': '7인치(17.78cm), 네바퀴서스펜션',
      'size': '53cm x 51cm x 91cm',
      'busketSize': '22L',
      'belt': '',
      'lmtAge': '36개월',
      'lmtWet': '22kg',
      'color': '레몬옐로우, 개같은거한개만써',
    }),
    Product.fromMap({
      'id': 5,
      'majorClass': '출산/유아동',
      'middleClass': '유모차/웨건',
      'minorClass': '초경량/휴대용유모차',
      'imageUrl': 'https://shopping-phinf.pstatic.net/main_3867510/38675102619.20230404150756.jpg',
      'pageUrl': 'https://brand.naver.com/yupbaby/products/7938842785',
      'productName': '지니제로3',
      'brand': '와이업',
      'salesCom': '와이업',
      'price': 55,
      'madeIn': '중국',
      'spices': '휴대용',
      'folding': '원액션폴딩',
      'material': '',
      'weight': '4.8kg',
      'ceiling': '4단',
      'wheel': '',
      'size': '',
      'busketSize': '30L',
      'belt': '5점식',
      'lmtAge': '',
      'lmtWet': '',
      'color': '',
    }),
    Product.fromMap({
      'id': 6,
      'majorClass': '출산/유아동',
      'middleClass': '유모차/웨건',
      'minorClass': '초경량/휴대용유모차',
      'imageUrl': 'https://shopping-phinf.pstatic.net/main_4434657/44346576618.20231213105043.jpg?type=f640',
      'pageUrl': 'https://brand.naver.com/tavo/products/9600875213',
      'productName': '플렉스 탭3',
      'brand': '타보',
      'salesCom': '타보',
      'price': 15,
      'madeIn': '중국',
      'spices': '휴대용',
      'folding': '오토폴딩',
      'material': '',
      'weight': '20.8kg',
      'ceiling': '5단',
      'wheel': '',
      'size': '',
      'busketSize': '',
      'belt': '5점식',
      'lmtAge': '',
      'lmtWet': '22kg',
      'color': '',
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
          title: Text('moby'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(width * 0.024)),

            SizedBox(height: 10,),
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
            SizedBox(height: 10,),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = products[index];
                  bool isChecked = isCheckedList[index];

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Image.network(
                        product.imageUrl,
                        width: width * 0.5,
                      ),
                      SizedBox(width: 10), // 이미지와 컨텐츠 간격 조정
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID: ${product.id}'),
                            Text('대분류: ${product.majorClass}'),
                            Text('중분류: ${product.middleClass}'),
                            Text('소분류: ${product.minorClass}'),
                            // Text('이미지 URL: ${product.imageUrl}'),
                            // Text('페이지 URL: ${product.pageUrl}'),
                            Text('제품명: ${product.productName}'),
                            Text('브랜드: ${product.brand}'),
                            Text('판매업체: ${product.salesCom}'),
                            Text('가격: ${product.price}원'),
                            Text('제조국: ${product.madeIn}'),
                            Text('향신료: ${product.spices}'),
                            Text('접이식 여부: ${product.folding}'),
                            Text('재료: ${product.material}'),
                            Text('무게: ${product.weight}'),
                            Text('천장: ${product.ceiling}'),
                            Text('휠: ${product.wheel}'),
                            Text('크기: ${product.size}'),
                            Text('바구니 크기: ${product.busketSize}'),
                            Text('벨트: ${product.belt}'),
                            Text('사용 제한 나이: ${product.lmtAge}'),
                            Text('사용 제한 무게: ${product.lmtWet}'),
                            Text('색상: ${product.color}'),
                          ],
                        ),
                      ),
                    ],
                  );
                },
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
                      List<Product> checkedProducts = [];
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
                            builder: (context) => ProductScreen(
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
                      '비교',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

            ),
            Container(padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DropDownListExample(

                            ),
                          ),
                        );
                      },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                    ),
                    child: const Text(
                      '예시',
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