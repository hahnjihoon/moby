import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart';

class ProductScreen extends StatefulWidget {
  final List<Product> data;

  ProductScreen({Key? key, required this.data}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('moby'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.data.length,
              (index) {
                Product product = widget.data[index];
                return SizedBox(
                  width: 200, // 고정된 너비
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID: ${product.id}'),
                          Text('대분류: ${product.majorClass}'),
                          Text('중분류: ${product.middleClass}'),
                          Text('소분류: ${product.minorClass}'),
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Text('ID: ${product.id}'),
// Text('대분류: ${product.majorClass}'),
// Text('중분류: ${product.middleClass}'),
// Text('소분류: ${product.minorClass}'),
// Text('제품명: ${product.productName}'),
// Text('브랜드: ${product.brand}'),
// Text('판매업체: ${product.salesCom}'),
// Text('가격: ${product.price}원'),
// Text('제조국: ${product.madeIn}'),
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
// Text('색상: ${product.color}'),
