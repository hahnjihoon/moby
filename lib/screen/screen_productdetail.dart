import 'package:flutter/material.dart';
import 'package:moby/model/model_dbahck.dart';
import 'package:moby/screen/screen_main.dart';
import 'package:moby/screen/screen_categori.dart';

class ProductdetailScreen extends StatefulWidget{

  final Dbahck item;

  // const ProductdetailScreen({Key? key, required this.items}) : super(key: key);
  const ProductdetailScreen({required this.item, Key? key}) : super(key: key);

  @override
  _ProductdetailScreenState createState() => _ProductdetailScreenState();
}

class _ProductdetailScreenState extends State<ProductdetailScreen> {

  @override
  void initState(){
    super.initState();
    print('ddas:: ${widget.item}');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    print('선택된 인덱스: $index');
    // Navigator.of(context).pop(true)  //페이지 제거
    // 2. SystemNavigator.pop() // 앱 종료
    // 3. exit(0) //강제종료

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriScreen()),
        );
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        break;
    }
  }

  int _selectedIndex = 1; // 바텀바의 초기 선택 인덱스

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(

            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.item.productName, // 여기에 제품명을 넣어주세요
                  style: TextStyle(
                    fontSize: 20, // 제품명 폰트 크기 조절
                    fontWeight: FontWeight.bold, // 제품명 폰트 굵기 조절
                  ),
                ),
              ],
            ),
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              // 이미지
              Image.network(
                widget.item.imageUrl,
                width: width*0.8,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20), // 간격 조절을 위한 SizedBox 추가
              // 제품명
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '제품명: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 40),
                  Text(
                    widget.item.productName,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // 간격 조절을 위한 SizedBox 추가
              // 제품 내용
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '제품내용: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.item.majorClass,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.middleClass,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.minorClass,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.brand,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.salesCom,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.price.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.madeIn,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.spices,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.folding,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text(
                                widget.item.material,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.weight,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.ceiling,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.wheel,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.busketSize,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.belt,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.lmtAge,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.lmtWet,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.item.color,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )

                        ],
                      ),



                    ],
                  ),

                ],

              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => ProductlistScreen(category: '유모차')),
                  // );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // 배경색을 투명으로 설정
                  minimumSize: MaterialStateProperty.all<Size>(const Size(200, 70)), // 크기 설정
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), // 버튼의 모서리를 둥글게 할지 설정 (0.0으로 설정하면 직사각형)
                      side: const BorderSide(color: Colors.black), // 테두리 색상 설정
                    ),
                  ),
                ),
                child: Text('구매하기', style: TextStyle(color: Colors.black)),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Mypage',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}