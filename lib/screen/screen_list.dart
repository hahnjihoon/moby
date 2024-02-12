import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart'; //이렇게임포트시키고 클래스명으로 사용가능
import 'package:moby/screen/screen_product.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
    Product.fromMap({
      'name': '유모차4',
      'weight': '40kg',
      'height': '1.2m',
      'length': '70cm',
      'width': '50cm',
      'comfort': '좆구림',
      'price': 90000
    }),
    Product.fromMap({
      'name': '유모차5',
      'weight': '40kg',
      'height': '1.2m',
      'length': '70cm',
      'width': '50cm',
      'comfort': '좆구림',
      'price': 90000
    }),
    Product.fromMap({
      'name': '유모차6',
      'weight': '40kg',
      'height': '1.2m',
      'length': '70cm',
      'width': '50cm',
      'comfort': '좆구림',
      'price': 90000
    }),
    Product.fromMap({
      'name': '유모차7',
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
            Padding(padding: EdgeInsets.all(width * 0.024)),
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
                      Image.asset(
                        'images/car${index + 1}.png',
                        width: width * 0.2,
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
          ],
        ),
      ),
    );
  }
}