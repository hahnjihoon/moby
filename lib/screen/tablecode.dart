import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart';

class ProductColumn extends StatelessWidget {
  final List<Product> data;
  const ProductColumn({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: DataTable(
          columns: [
            DataColumn(label: Text('상품명')),
            for (var product in data)
              DataColumn(label: Text(product.productName)),
          ],
          rows: [
            for (var title in [
              '이미지',
              'id',
              '대분류',
              '중분류',
              '소분류',
              // '페이지',
              '브랜드',
              '제조사',
              '가격대',
              '생산국',
              '종류별',
              '접이식',
              '주재료',
              '무게군',
              '천장유',
              '바퀴류',
              '크기류',
              '바케스',
              '벨트류',
              '제한령',
              '제한중',
              '색상류'
            ])
              DataRow(
                cells: [
                  DataCell(Text(title)),
                  for (var product in data)
                    DataCell(_getColumnValue(product, title)),
                ],
              ),
            // DataRow(cells: cells)
          ],
        ),
      ),
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
