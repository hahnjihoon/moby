import 'package:flutter/material.dart';
import 'package:moby/model/model_dbahck.dart';

class SelectDbahckScreen extends StatefulWidget {
  final List<Dbahck> data;

  SelectDbahckScreen({Key? key, required this.data}) : super(key: key);

  @override
  _SelectDbahckScreenState createState() => _SelectDbahckScreenState();
}

class _SelectDbahckScreenState extends State<SelectDbahckScreen> {
  List<Dbahck> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = widget.data; // 초기에는 모든 데이터를 보여줌
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('moby_dbahck_compare'),
          backgroundColor: Colors.deepPurple,
          // leading: Container(),
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      filteredData = List.from(widget.data)
                        ..sort((a, b) => (a.id ?? 0).compareTo(b.id ?? 0));
                    });
                  },
                  child: Text('기본'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      filteredData = List.from(widget.data)
                        ..sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
                    });
                  },
                  child: Text('가격별'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      filteredData = widget.data
                        ..sort((a, b) {
                          final weightA = double.tryParse(a.weight?.replaceAll('kg', '') ?? '500.0') ?? 500.0; //무게없으면 제일뒤로가게 500줌
                          final weightB = double.tryParse(b.weight?.replaceAll('kg', '') ?? '500.0') ?? 500.0;
                          return weightA.compareTo(weightB);
                        });
                    });
                  },
                  child: Text('무게별'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("스벌"),
                          content: Text("크기뭐어쩌라고"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("확인"),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {
                    });
                  },
                  child: Text('크기별'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    filteredData.length,
                        (index) {
                          Dbahck product = filteredData[index];
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
          ],
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
