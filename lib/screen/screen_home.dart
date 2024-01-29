import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart'; //이렇게임포트시키고 클래스명으로 사용가능
import 'package:moby/screen/screen_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product.fromMap({
      'name': '유모차1',
      'weight': '20kg',
      'height': '1m',
      'length': '80cm',
      'width': '60cm',
      'comfort': '구림',
      'price': 50000
    }),
    Product.fromMap({
      'name': '유모차2',
      'weight': '30kg',
      'height': '1.5m',
      'length': '85cm',
      'width': '70cm',
      'comfort': '좋음',
      'price': 70000
    }),
    Product.fromMap({
      'name': '유모차3',
      'weight': '40kg',
      'height': '1.2m',
      'length': '70cm',
      'width': '50cm',
      'comfort': '좆구림',
      'price': 90000
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
            Text('이게로고'),
            Center(
              child: Image.asset(
                'images/logo.png',
                width: width * 0.06,
              ),
            ),
            Padding(padding: EdgeInsets.all(width * 0.024)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: products.asMap().entries.map((entry) {
                int index = entry.key;
                Product product = entry.value;

                bool isChecked = false; // 체크 상태를 나타내는 변수

                return Row(
                  children: [
                    Checkbox(
                      value: isCheckedList[index],
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedList[index] = value ?? false;
                        });
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/car${index + 1}.png',
                          width: width * 0.2,
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('이름: ${product.name}'),
                              Text('무게: ${product.weight}'),
                              Text('높이: ${product.height}'),
                              Text('길이: ${product.length}'),
                              Text('폭: ${product.width}'),
                              Text('승차감: ${product.comfort}'),
                              Text('가격: ${product.price}원'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }).toList(),
            ),
            Padding(padding: EdgeInsets.all(width * 0.024)),
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
                                ));
                      } else {
                        // print('선택된 제품들: $checkedProducts');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      data: checkedProducts,
                                    )));
                        // 버튼이 눌렸을 때 수행할 동작
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple, // 버튼의 배경색
                      onPrimary: Colors.white, // 텍스트 색상
                    ),
                    child: const Text(
                      '비 교',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//   Widget _buildStep(double width, String title) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(
//           width * 0.048, width * 0.024, width * 0.048, width * 0.024),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Icon(
//             Icons.check_box,
//             size: width * 0.04,
//           ),
//           Padding(padding: EdgeInsets.only(right: width * 0.024)),
//           Text(title),
//         ],
//       ),
//     );
//   }
// }
