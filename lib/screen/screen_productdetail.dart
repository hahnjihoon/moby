import 'package:flutter/material.dart';
import 'package:moby/model/model_dbahck.dart';

class ProductdetailScreen extends StatefulWidget{

  final Dbahck items;

  // const ProductdetailScreen({Key? key, required this.items}) : super(key: key);
  const ProductdetailScreen({required this.items, Key? key}) : super(key: key);

  @override
  _ProductdetailScreenState createState() => _ProductdetailScreenState();
}

class _ProductdetailScreenState extends State<ProductdetailScreen> {

  @override
  void initState(){
    super.initState();
    print('ddas:: ${widget.items}');
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(
                icon: const Icon(Icons.menu), // 오른쪽에 메뉴 아이콘
                iconSize: 40, // 아이콘 크기 조절
                onPressed: () {
                  // 메뉴 버튼이 클릭되었을 때의 동작
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("알림"),
                        content: Text("메뉴를 눌렀습니다."),
                        actions: [
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}