import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:moby/model/model_car.dart';

class HtmlScreen extends StatefulWidget {
  final List<Product> data;

  HtmlScreen({Key? key, required this.data}) : super(key: key);

  @override
  _HtmlScreenState createState() => _HtmlScreenState();
}

class _HtmlScreenState extends State<HtmlScreen> {
  List<Product> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = widget.data; // 초기에는 모든 데이터를 보여줌
  }

  @override
  Widget build(BuildContext context) {
    print('ddd $filteredData');
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('moby_dbahck_table_compare'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
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
                        ..sort(
                            (a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
                    });
                  },
                  child: Text('가격별'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      filteredData = widget.data
                        ..sort((a, b) {
                          final weightA = double.tryParse(
                                  a.weight?.replaceAll('kg', '') ?? '500.0') ??
                              500.0; //무게없으면 제일뒤로가게 500줌
                          final weightB = double.tryParse(
                                  b.weight?.replaceAll('kg', '') ?? '500.0') ??
                              500.0;
                          return weightA.compareTo(weightB);
                        });
                    });
                  },
                  child: Text('무게별'),
                ),
              ],
            ),
            SizedBox(height: 10), // 버튼과 아래의 리스트뷰 사이에 간격 추가
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  // final product = filteredData[index];
                  // filteredData.length;
                  // (index) {
                  //   Product product = filteredData[index];
                  return Stack(
                    children: [
                      Positioned(
                        // top: (height - 100) / 2, // 화면 높이의 중간에서 시작
                        // left: (width * 0.5) - (width * 1.5) / 2, // 화면 너비의 중앙에서 시작
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: width*0.9,
                            height: height*0.7,
                            color: Colors.blueAccent,
                            padding: const EdgeInsets.only(left: 80),
                            child: Html(
                              data: """
                                
                              <div style="display: flex; flex-direction: row;">
                              ${filteredData.isNotEmpty ? List.generate(filteredData.length, (index) {
                                Product product = filteredData[index];
                                return """
                                <div style="flex: 1;"> || && <|end of prompt|>
                                    <ul>
                                      
                                            <li>${product.id}</li>
                                            <li>${product.majorClass}</li>
                                            <li>${product.middleClass}</li>
                                            <li>${product.minorClass}</li>
                                            <li>${product.productName}</li>
                                            <li>${product.brand}</li>
                                            <li>${product.salesCom}</li>
                                            <li>${product.price}원</li>
                                            <li>${product.madeIn}</li>
                                            <li>${product.spices}</li>
                                            <li>${product.folding}</li>
                                            <li>${product.material}</li>
                                            <li>${product.weight}</li>
                                            <li>${product.ceiling}</li>
                                            <li>${product.wheel}</li>
                                            <li>${product.size}</li>
                                            <li>${product.busketSize}</li>
                                            <li>${product.belt}</li>
                                            <li>${product.lmtAge}</li>
                                            <li>${product.color}</li>
                                          
                                    </ul>
                                  </div>
                                """;
                                }).join('\n') : ''}
                              </div>
                                """,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 150, // 첫 번째 Positioned의 너비
                          height: height*0.7, // 첫 번째 Positioned의 높이
                          color: Colors.red,
                          // padding: const EdgeInsets.only(left: 1),
                          child: Html(
                            data: '''
                                  <div style="overflow-y: auto; height: 1000px;">
                                    
                                        <ul>
                                          <li>순번</li>
                                          <li>대분류</li>
                                          <li>중분류</li>
                                          <li>소분류</li>
                                          <li>제품명</li>
                                          <li>브랜드</li>
                                          <li>판매업체</li>
                                          <li>가격</li>
                                          <li>제조국</li>
                                          <li>종류</li>
                                          <li>접이식</li>
                                          <li>재료</li>
                                          <li>무게</li>
                                          <li>천장</li>
                                          <li>휠</li>
                                          <li>크기</li>
                                          <li>바구니</li>
                                          <li>벨트</li>
                                          <li>제한나이</li>
                                          <li>제한무게</li>
                                          <li>색상</li>
                                        </ul>
                                      
                                  </div>
                                  ''',
                          ),
                        ),
                      ),
                    ],
                  );
                  // };
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
