import 'package:flutter/material.dart';

class VerhoScreen extends StatelessWidget {
  VerhoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dual Scroll Example'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Colors.blue,
            child: Column(
              children: List.generate(
                9,
                    (index) => Container(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        9,
                            (index) => Container(
                          width: 200,
                          color: _getColor(index),
                          child: Center(
                            child: Text(
                              'Item $index',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    switch (index % 3) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }
}
