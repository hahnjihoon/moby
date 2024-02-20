import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart';

class ProductColumn extends StatelessWidget {
  final List<Product> data;
  const ProductColumn({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(label: Text('상품명')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('가격')),
                ]),
                DataRow(cells: [
                  DataCell(Text('제조국')),
                ]),
                DataRow(cells: [
                  DataCell(Text('스펙')),
                ]),
                DataRow(cells: [
                  DataCell(Text('접이')),
                ]),
                DataRow(cells: [
                  DataCell(Text('재질')),
                ]),
                DataRow(cells: [
                  DataCell(Text('무게')),
                ]),
                DataRow(cells: [
                  DataCell(Text('천장')),
                ]),
                DataRow(cells: [
                  DataCell(Text('바퀴')),
                ]),
                DataRow(cells: [
                  DataCell(Text('크기')),
                ]),
                DataRow(cells: [
                  DataCell(Text('바스켓 크기')),
                ]),
                DataRow(cells: [
                  DataCell(Text('벨트')),
                ]),
                DataRow(cells: [
                  DataCell(Text('제한 연령')),
                ]),
                DataRow(cells: [
                  DataCell(Text('제한 무게')),
                ]),
                DataRow(cells: [
                  DataCell(Text('색상')),
                ]),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DataTable(
                columns: [
                  for (var product in data)
                    DataColumn(label: Text(product.productName)),
                ],
                rows: [
                  DataRow(cells: [
                    for (var product in data)
                      DataCell(Text(product.price.toString())),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.madeIn)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.spices)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.folding)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.material)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.weight)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.ceiling)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.wheel)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.size)),
                  ]),
                  DataRow(cells: [
                    for (var product in data)
                      DataCell(Text(product.busketSize)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.belt)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.lmtAge)),
                  ]),
                  DataRow(cells: [
                    for (var product in data) DataCell(Text(product.lmtWet)),
                  ]),
                  DataRow(cells: [
                    // DataCell(Text('색상')),
                    for (var product in data) DataCell(Text(product.color)),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getColumnValue(Product product, String columnTitle) {
    switch (columnTitle) {
      case 'id':
        return Text(product.id.toString());
      case '대분류':
        return Text(product.majorClass);
      case '중분류':
        return Text(product.middleClass);
      case '소분류':
        return Text(product.minorClass);
      case '이미지':
        return Image.network(
          product.imageUrl,
          width: 140, // 이미지 너비 조절
          height: 140, // 이미지 높이 조절
        );
      case '페이지':
        return Text(product.pageUrl);
      case '브랜드':
        return Text(product.brand);
      case '제조사':
        return Text(product.salesCom);
      case '가격대':
        return Text(product.price.toString());
      case '생산국':
        return Text(product.madeIn);
      case '종류별':
        return Text(product.spices);
      case '접이식':
        return Text(product.folding);
      case '주재료':
        return Text(product.material);
      case '무게군':
        return Text(product.weight);
      case '천장유':
        return Text(product.ceiling);
      case '바퀴류':
        return Text(product.wheel);
      case '크기류':
        return Text(product.size);
      case '바케스':
        return Text(product.busketSize);
      case '벨트류':
        return Text(product.belt);
      case '제한령':
        return Text(product.lmtAge);
      case '제한중':
        return Text(product.lmtWet);
      case '색상류':
        return Text(product.color);
      default:
        return Text('');
    }
  }
}

class TableScreen extends StatelessWidget {
  final List<Product> data;
  const TableScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제품 목록'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductColumn(data: data), // 상품 데이터를 가진 컬럼 위젯
            // 여기에 다른 위젯을 추가할 수 있음
          ],
        ),
      ),
    );
  }
}
