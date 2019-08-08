import 'package:flutter/material.dart';

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView({
    Key key,
    final String title = '',
    final Widget icon,
    final Widget activeIcon,
  }) : item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: Text(
            title,
          ),
          backgroundColor: Colors.white,
        );
}

class WaterTabBar extends StatefulWidget {
  /// 是否有加号按钮
  final bool hasPlusButton;

  /// appBar Widget
  final Widget appBar;

  /// 主体内容
  final Widget body;

  /// 底部按钮配置
  List<NavigationIconView> btmNavbar = [];

  /// 组件通信
  final Function onTabClick;

  /// 底部button选中颜色
  final Color selectedColor;

  /// +号按钮选中颜色
  final Color plusButtonSelectedColor;

  /// +号按钮索引
  int plusButtonindex;

  /// btmNavbar数组长度
  int len;
  WaterTabBar(
      {Key key,
      this.body,
      this.appBar,
      this.btmNavbar,
      this.selectedColor = Colors.blue,
      this.plusButtonSelectedColor = Colors.yellow,
      this.hasPlusButton = false,
      this.onTabClick})
      : super(key: key) {
    // 解决tab为基数问题
    if (this.hasPlusButton) {
      this.len = this.btmNavbar.length;
      if (this.len % 2 == 0) {
        // btmNavbar偶数
        this.plusButtonindex = this.len ~/ 2;
        this.btmNavbar.insert(this.len ~/ 2,
            NavigationIconView(icon: Icon(Icons.ac_unit, size: 0)));
      } else {
        // btmNavbar基数
        this.plusButtonindex = this.len ~/ 2 + 1;
        this.btmNavbar.insert(this.len ~/ 2 + 1,
            NavigationIconView(icon: Icon(Icons.ac_unit, size: 0)));
        this
            .btmNavbar
            .add(NavigationIconView(icon: Icon(Icons.ac_unit, size: 0)));
      }
    }
  }
  @override
  State<StatefulWidget> createState() => _WaterTabBarState();
}

class _WaterTabBarState extends State<WaterTabBar> {
  /// 选中的索引
  int _activeTabIndex = 0;

  /// +号按钮背景色
  Color _plusButtonBackgroundColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    /// 底部导航栏
    var _bottomNavigationBar = BottomNavigationBar(
      items: widget.btmNavbar
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(),
      currentIndex: _activeTabIndex,
      fixedColor: widget.selectedColor,
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      type: BottomNavigationBarType.fixed,
      onTap: _onTabClick,
    );

    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: _bottomNavigationBar,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 40.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: widget.hasPlusButton
              ? FloatingActionButton(
                  elevation: 0,
                  highlightElevation: 0,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 36,
                  ),
                  onPressed: () {
                    _onTabClick(widget.plusButtonindex);
                  },
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.white, width: 3.5)),
                  backgroundColor: _plusButtonBackgroundColor)
              : Text(''),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// 单击事件
  void _onTabClick(int index) {
    if (widget.hasPlusButton) {
      if (index == widget.len + 1) {
        index -= 1;
      }
      setState(() {
        _plusButtonBackgroundColor = index == widget.plusButtonindex
            ? widget.plusButtonSelectedColor
            : Color(0xFFE0E0E0);
      });
    }
    setState(() {
      _activeTabIndex = index;
    });
    if (widget.onTabClick != null) {
      widget.onTabClick(_activeTabIndex);
    }
  }
}
