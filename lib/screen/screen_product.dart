import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart';

class ProductScreen extends StatefulWidget {
  List<Product> data;

  ProductScreen({Key? key, required this.data}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List.filled(widget.data.length, false);

    // 여기에 데이터 출력
    print('Received data in ProductScreen: ${widget.data}');
  }

  @override
  Widget build(BuildContext context) {
    // print('Received data in ProductScreen: ${widget.data}');
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('moby'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.deepPurple),
                  color: Colors.deepPurple,
                ),
                width: width-30,
                height: height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // 가로 스크롤을 위한 설정
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    Product product = widget.data[index];

                    return Row(
                      children: [
                        // Checkbox(
                        //   value: isCheckedList[index],
                        //   onChanged: (bool? value) {
                        //     setState(() {
                        //       isCheckedList[index] = value ?? false;
                        //     });
                        //   },
                        // ),
                        Container(
                          // width: width * widget.data.length/6, // 가로 공간을 적절히 나누세요
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
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
            ),
          ],
        ),
        floatingActionButton: _buildCompareButton(),
      ),
    );
  }

  Widget _buildCompareButton() {
    List<Product> selectedProducts = [];
    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        selectedProducts.add(widget.data[i]);
      }
    }

    return FloatingActionButton(
      onPressed: selectedProducts.length >= 2
          ? () {
              // 비교 버튼 동작
              print('선택된 제품들: $selectedProducts');
            }
          : null,
      backgroundColor:
          selectedProducts.length >= 2 ? Colors.deepPurple : Colors.grey,
      tooltip: '비교',
      child: Icon(Icons.compare),
    );
  }
}
