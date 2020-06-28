import 'package:cavewall/config/index.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class Navigater extends StatefulWidget {
  @override
  _NavigaterState createState() => _NavigaterState();
}

class _NavigaterState extends State<Navigater> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ImagePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue[800],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AppIcons.dupianhui),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.ku),
            title: Text('我'),
          )
        ],
      ),
    );
  }
}
