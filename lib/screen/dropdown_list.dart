import 'package:flutter/material.dart';

class DropDownListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown List Example'),
        ),
        body: Center(
          child: ListBox(),
        ),
      ),
    );
  }
}

class ListBox extends StatefulWidget {
  @override
  _ListBoxState createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3']; // 리스트 아이템 데이터

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: items.first, // 초기 선택 항목은 리스트의 첫 번째 아이템으로 설정
      onChanged: (String? newValue) {
        // 선택된 항목이 변경되면 실행되는 함수
        setState(() {
          // 선택된 항목을 newValue로 업데이트
          if (newValue != null) {
            items.remove(newValue); // 선택된 항목은 리스트에서 제거
            items.insert(0, newValue); // 선택된 항목을 리스트 맨 앞에 추가
          }
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(DropDownListExample());
}
