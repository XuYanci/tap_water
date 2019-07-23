import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/TapWaterTabBar.dart';
import 'TapWaterContentWidget.dart';

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView({
    Key key,
    String title,
    Widget icon,
    Widget avtiveIcon,
  }) : item = new BottomNavigationBarItem(
          icon: icon,
          activeIcon: avtiveIcon,
          title: new Text(title),
          backgroundColor: Colors.white,
        );
}

class TapWaterMainWidget extends StatefulWidget {
  final bool isButton;
  final List<Map<String, dynamic>> btmNavbar;
  TapWaterMainWidget({this.btmNavbar, this.isButton = false}) {
    final int _len = this.btmNavbar.length;
    // final int _len = 5;
    if (this.isButton) {
      if (_len % 2 == 0) {
        this.btmNavbar.insert(_len ~/ 2, null);
      } else {
        this.btmNavbar.insert(_len ~/ 2 + 1, null);
        this.btmNavbar.insert(_len ~/ 2 + 2, null);
      }
    }
  }

  @override
  _TapWaterMainWidgetState createState() => _TapWaterMainWidgetState();
}

class _TapWaterMainWidgetState extends State<TapWaterMainWidget> {
  PageController _pageController;
  int _currentIndex = 0;
  List<Widget> _pages;
  //添加图片地址,需要动态更换图片
  String bigImg = 'images/post_normal.png';
  int page = 0;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      TapWaterContentWidget("first"),
      TapWaterContentWidget("two"),
      TapWaterContentWidget("five"),
      TapWaterContentWidget("three"),
      TapWaterContentWidget("four"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('xxx');
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _pages[index];
              },
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TapWaterTabBar(
                isButton: widget.isButton, btmNavbar: widget.btmNavbar),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    if (index != 2) {
      setState(() {
        this.bigImg = 'images/post_normal.png';
      });
    } else {
      setState(() {
        this.bigImg = 'images/post_highlight.png';
      });
    }
    _pageController.jumpToPage(index);
  }

  //添加图片的点击事件
  void onBigImgTap() {
    setState(() {
      this.page = 2;
      this.bigImg = 'images/post_highlight.png';
      onTap(2);
    });
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
