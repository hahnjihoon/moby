import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:moby/model/model_dbahck.dart';

class HtmlDbahckScreen extends StatefulWidget {
  final List<Dbahck> data;

  HtmlDbahckScreen({Key? key, required this.data}) : super(key: key);

  @override
  _HtmlDbahckScreenState createState() => _HtmlDbahckScreenState();
}

class _HtmlDbahckScreenState extends State<HtmlDbahckScreen> {
  List<Dbahck> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = replaceEmptyValues(widget.data);
  }

  List<Dbahck> replaceEmptyValues(List<Dbahck> data) {
    List<Dbahck> updatedData = [];
    for (var product in data) {
      // 각각의 Product 객체를 새로운 객체로 생성하여 처리합니다.
      // 그래야 원본 데이터를 변경하지 않고 새로운 데이터를 만들 수 있습니다.
      Dbahck updatedProduct = Dbahck(
        id: product.id ?? 0, // id가 null이면 '-'로 대체
        majorClass: product.majorClass ?? '-', // majorClass가 null이면 '-'로 대체
        middleClass: product.middleClass ?? '-', // middleClass가 null이면 '-'로 대체
        minorClass: product.minorClass ?? '-', // minorClass가 null이면 '-'로 대체
        productName: product.productName ?? '-',
        imageUrl: product.imageUrl ?? '-',
        pageUrl: product.pageUrl ?? '-',
        brand: product.brand ?? '-', // brand가 null이면 '-'로 대체
        salesCom: product.salesCom ?? '-', // salesCom이 null이면 '-'로 대체
        price: product.price ?? 0, // price가 null이면 '-'로 대체
        madeIn: product.madeIn ?? '-', // madeIn이 null이면 '-'로 대체
        spices: product.spices ?? '-', // spices가 null이면 '-'로 대체
        folding: product.folding ?? '-', // folding이 null이면 '-'로 대체
        material: product.material ?? '-', // material이 null이면 '-'로 대체
        weight: product.weight ?? '-', // weight가 null이면 '-'로 대체
        ceiling: product.ceiling ?? '-', // ceiling이 null이면 '-'로 대체
        wheel: product.wheel ?? '-', // wheel이 null이면 '-'로 대체
        size: product.size ?? '-', // size가 null이면 '-'로 대체
        busketSize: product.busketSize ?? '-', // busketSize가 null이면 '-'로 대체
        belt: product.belt ?? '-', // belt가 null이면 '-'로 대체
        lmtAge: product.lmtAge ?? '-', // lmtAge가 null이면 '-'로 대체
        lmtWet: product.lmtWet ?? '-', // lmtWet가 null이면 '-'로 대체
        color: product.color ?? '-',
         // color가 null이면 '-'로 대체
      );
      updatedData.add(updatedProduct); // 대체된 데이터를 업데이트된 데이터 리스트에 추가합니다.
    }
    return updatedData;
  }


  @override
  Widget build(BuildContext context) {
    // print('ddd $filteredData');
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
                          child: Row(children: [
                            Container(
                                width: 111,
                                height: height*0.63,
                                color: Colors.white,),
                            for (var product in filteredData)
                              Container(
                                width: width * 0.5,
                                height: height*0.63,
                                color: Colors.white,
                                child: Html(
                                  data: """
                                
                              <div style="display: flex; flex-direction: row;">
                                <div style="display: flex; flex-direction: row;">
                                  <div style="border: 1px solid black; width: 100px; height: 100px;"><img src=${product.imageUrl}></img></div>
                                  <div style="border: 1px solid black;">${product.id}</div>
                                  <div style="border: 1px solid black;">${product.majorClass}</div>
                                  <div style="border: 1px solid black;">${product.middleClass}</div>
                                  <div style="border: 1px solid black;">${product.minorClass}</div>
                                  <div style="border: 1px solid black;">${product.productName}</div>
                                  <div style="border: 1px solid black;">${product.brand}</div>
                                  <div style="border: 1px solid black;">${product.salesCom}</div>
                                  <div style="border: 1px solid black;">${product.price}원</div>
                                  <div style="border: 1px solid black;">${product.madeIn}</div>
                                  <div style="border: 1px solid black;">${product.spices}</div>
                                  <div style="border: 1px solid black;">${product.folding}</div>
                                  <div style="border: 1px solid black;">${product.material}</div>
                                  <div style="border: 1px solid black;">${product.weight}</div>
                                  <div style="border: 1px solid black;">${product.ceiling}</div>
                                  <div style="border: 1px solid black;">${product.wheel}</div>
                                  <div style="border: 1px solid black;">${product.size}</div>
                                  <div style="border: 1px solid black;">${product.busketSize}</div>
                                  <div style="border: 1px solid black;">${product.belt}</div>
                                  <div style="border: 1px solid black;">${product.lmtAge}</div>
                                  <div style="border: 1px solid black;">${product.lmtWet}</div>
                                  <div style="border: 1px solid black;">${product.color}</div>
                                </div>
                              </div>
                                """,
                                ),
                              )
                          ]),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 110, // 첫 번째 Positioned의 너비
                          height: height*0.63, // 첫 번째 Positioned의 높이
                          color: Colors.grey,
                          // padding: const EdgeInsets.only(left: 1),
                          child: Html(
                            data: '''
                                  
                                  <div style="justify-content: center; align-items: center; border: 1px solid black; width: 95px; height: 100px;">이미지</div>
   <div style="border: 1px solid #000;">순번</div>
    <div style="border: 1px solid #000;">대분류</div>
    <div style="border: 1px solid #000;">중분류</div>
    <div style="border: 1px solid #000;">소분류</div>
    <div style="border: 1px solid #000;">제품명</div>
    <div style="border: 1px solid #000;">브랜드</div>
    <div style="border: 1px solid #000;">판매업체</div>
    <div style="border: 1px solid #000;">가격</div>
    <div style="border: 1px solid #000;">제조국</div>
    <div style="border: 1px solid #000;">종류</div>
    <div style="border: 1px solid #000;">접이식</div>
    <div style="border: 1px solid #000;">재료</div>
    <div style="border: 1px solid #000;">무게</div>
    <div style="border: 1px solid #000;">천장</div>
    <div style="border: 1px solid #000;">휠</div>
    <div style="border: 1px solid #000;">크기</div>
    <div style="border: 1px solid #000;">바구니</div>
    <div style="border: 1px solid #000;">벨트</div>
    <div style="border: 1px solid #000;">제한나이</div>
    <div style="border: 1px solid #000;">제한무게</div>
    <div style="border: 1px solid #000;">색상</div>
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
