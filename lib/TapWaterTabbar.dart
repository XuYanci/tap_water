import 'package:flutter/material.dart';
import 'package:tap_water_tab_bar/TapWaterTabItem.dart';

const String bigImg = 'images/post_normal.png';

class TapWaterTabBar extends StatefulWidget {
  final bool isButton;
  List<Map<String, dynamic>> btmNavbar = [];
  TapWaterTabBar({this.btmNavbar, this.isButton = false});
  @override
  State<StatefulWidget> createState() => _TapWaterTabBarState();
}

class _TapWaterTabBarState extends State<TapWaterTabBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.btmNavbar
                .map((v) =>  v != null ? TapWaterTabItem(title: v['title'], icon: v['icon']) : (widget.isButton ? TapWaterTabItem() : Text('')))
                .toList()  
            ,
          ),
        ),
        Positioned(
          child: widget.isButton
              ? Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 60,
                  child: Image.asset(bigImg),
                )
              : Text(''),
        )
//        IgnorePointer(
//          child: Container(
//            decoration: const BoxDecoration(color: Colors.transparent),
//            child: Align(
//              heightFactor: 1,
//              child: OverflowBox(
//                child: ,
//              ),
//            ),
//          ),
//        )
      ],
    );
  }
}
