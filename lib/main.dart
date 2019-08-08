import 'package:flutter/material.dart';
import 'widget/navigation_bar.dart';
import 'tap_water_tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _MyAppPage());
  }
}

class _MyAppPage extends StatefulWidget {
  _MyAppPage({Key key}) : super(key: key);

  @override
  _MyAppPageState createState() => new _MyAppPageState();
}

class _MyAppPageState extends State<_MyAppPage> {

  /// 当前选中页面
  int _currentPageIndex = 0;

  /// 页面集合
  var _pages = [
    Align(
      alignment: Alignment.center,
      child: Text('页面1'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面2'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面3'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面4'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面5'),
    ),
    Align(
      alignment: Alignment.center,
      child: Text('页面6'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return WaterTabBar(
        hasPlusButton: true,
        selectedColor: Colors.black,
        appBar: NavigationBar(),
        body: _pages[_currentPageIndex],
        btmNavbar: <NavigationIconView>[
          NavigationIconView(
            title: '首页',
            icon: ImageIcon(
                AssetImage('resources/images/home/home_normal@2x.png'),
                color: Colors.black),
            activeIcon: ImageIcon(
                AssetImage('resources/images/home/home_highlight@2x.png'),
                color: Colors.black),
          ),
          NavigationIconView(
            title: '鱼塘',
            icon: ImageIcon(
                AssetImage('resources/images/fishpond/fishpond_normal@2x.png'),
                color: Colors.black),
            activeIcon: ImageIcon(
                AssetImage(
                    'resources/images/fishpond/fishpond_highlight@2x.png'),
                color: Colors.black),
          ),
          NavigationIconView(
            title: '消息',
            icon: ImageIcon(
                AssetImage('resources/images/message/message_normal@2x.png'),
                color: Colors.black),
            activeIcon: ImageIcon(
                AssetImage('resources/images/message/message_highlight@2x.png'),
                color: Colors.black),
          ),
          NavigationIconView(
            title: '我的',
            icon: ImageIcon(
                AssetImage('resources/images/account/account_normal@2x.png'),
                color: Colors.black),
            activeIcon: ImageIcon(
                AssetImage('resources/images/account/account_highlight@2x.png'),
                color: Colors.black),
          ),
        ],
        onTabClick: onTabClick);
  }

  void onTabClick(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    print('$index');
  }
}
