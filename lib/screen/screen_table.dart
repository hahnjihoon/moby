import 'package:flutter/material.dart';
import 'package:moby/model/model_car.dart';

class ProductColumn extends StatefulWidget {
  final List<Product> data;
  const ProductColumn({Key? key, required this.data}) : super(key: key);

  @override
  _ProductColumnState createState() => _ProductColumnState();
}

class _ProductColumnState extends State<ProductColumn> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Column(
      children: [
        Row(),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              // decoration: BoxDecoration(
              //   border: Border.all(),
              //   borderRadius: BorderRadius.circular(10.0),
              // ),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('아이디')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('이미지')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('상품명')),
                  ]),
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
                    DataCell(Text('바스켓')),
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
                  DataRow(cells: [
                    DataCell(Text('색상')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('색상')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('색상')),
                  ]),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),

                // decoration: BoxDecoration(
                //   border: Border.all(),
                //   borderRadius: BorderRadius.circular(10.0),
                // ),

                child: DataTable(
                  columns: [
                    for (var product in widget.data)
                      DataColumn(label: Text(product.id.toString())),
                  ],
                  rows: [
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Container(
                          height: 300, // 행의 높이 조절
                          child: Image.network(
                            product.imageUrl,
                            width: 140, // 이미지 너비 조절
                            height: 140, // 이미지 높이 조절
                            fit: BoxFit.cover,
                          ),
                        )),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.productName)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.price.toString())),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.madeIn)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.spices)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.folding)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.material)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.weight)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.ceiling)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.wheel)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.size)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.busketSize)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.belt)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.lmtAge)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.lmtWet)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.color)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.color)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.color)),
                    ]),
                    DataRow(cells: [
                      for (var product in widget.data)
                        DataCell(Text(product.color)),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TableScreen extends StatefulWidget {
  final List<Product> data;
  const TableScreen({Key? key, required this.data}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제품 목록'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ProductColumn(data: widget.data), // 상품 데이터를 가진 컬럼 위젯
            // 여기에 다른 위젯을 추가할 수 있음
          ],
        ),
      ),
    );
  }
}
