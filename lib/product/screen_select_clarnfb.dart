import 'package:flutter/material.dart';
import 'package:moby/model/model_clarnfb.dart';
import 'package:moby/model/model_zktlxm.dart';

class SelectClarnfbScreen extends StatefulWidget {
  final List<Clarnfb> data;

  SelectClarnfbScreen({Key? key, required this.data}) : super(key: key);

  @override
  _SelectClarnfbScreenState createState() => _SelectClarnfbScreenState();
}

class _SelectClarnfbScreenState extends State<SelectClarnfbScreen> {
  List<Clarnfb> filteredData = [];

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
                          Clarnfb product = filteredData[index];
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
                                Text('무게: ${product.weight}'),
                                Text('크기: ${product.size}'),
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

