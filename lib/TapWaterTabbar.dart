import 'package:flutter/material.dart';

// Navigation Item
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

class TapWaterTabbar extends StatefulWidget {
@override
_TapWaterTabbarState createState() => _TapWaterTabbarState();
}

class _TapWaterTabbarState extends State<TapWaterTabbar> {
/// Page Controller
PageController _pageController;
/// Current Select Index
int _currentIndex = 0;
/// TabItems
List<NavigationIconView> _navgationViews;
/// Pages 
List<Widget> _pages;
/// Post Image 
String postImage = 'images/post_normal.png';

// int page = 0;

@override
void initState() {
  super.initState();
  _navgationViews = [
    NavigationIconView(
        title: '微信',
        icon: Icon(Icons.ac_unit),
        avtiveIcon: Icon(Icons.backspace)),
    NavigationIconView(
        title: '通讯录',
        icon: Icon(Icons.backup),
        avtiveIcon: Icon(Icons.cached)),
    NavigationIconView(
        title: '',
        icon: Icon(Icons.publish),
        avtiveIcon: Icon(Icons.public)),
    NavigationIconView(
        title: '发现',
        icon: Icon(Icons.dashboard),
        avtiveIcon: Icon(Icons.edit)),
    NavigationIconView(
      title: '我的',
      icon: Icon(Icons.memory),
      avtiveIcon: Icon(Icons.drive_eta),
    )

  ];

  _pageController = PageController(initialPage: _currentIndex);
  _pages = [
    DemoWidget("first"),
    DemoWidget("two"),
    DemoWidget("five"),
    DemoWidget("three"),
    DemoWidget("four"),
  ];
}

@override
Widget build(BuildContext context) {
  final bottomNavbar = new BottomNavigationBar(
    fixedColor: Colors.green,
    items: _navgationViews
        .map((NavigationIconView navigationView) => navigationView.item)
        .toList(),
    currentIndex: _currentIndex,
    type: BottomNavigationBarType.fixed,
    onTap: onTap,
  );
return MaterialApp(
theme: ThemeData(primaryColor: Colors.blue),
home: Scaffold(
  body: Stack(
    children: <Widget>[
  Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      title: Text('微信'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
          
          },
        ),
      ],
    ),
    body: PageView.builder(
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
    bottomNavigationBar: bottomNavbar,
  ),
  Align(
    child: Padding(
      padding: const EdgeInsets.only(bottom:50.0),
      child: FloatingActionButton(
        child: new Image.asset(postImage),
        onPressed: onPostImageTap,
      ),
    ),
    alignment: Alignment.bottomCenter,
  ),
],
  )
)
  );

}
void onTap(int index) {
  if (index != 2) {
    setState(() {
      this.postImage = 'images/post_normal.png';
    });
  }else{
    setState(() {
      this.postImage = 'images/post_highlight.png';
    });
  }
  _pageController.jumpToPage(index);
}

// 添加图片的点击事件
void onPostImageTap() {
  setState(() {
    // this.page = 2;
    this.postImage = 'images/post_highlight.png';
    // onTap(2);
  });
}

void onPageChanged(int page) {
  setState(() {
    // this.page = page;
  });
}

}
