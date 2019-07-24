import 'package:flutter/material.dart';
import 'TapWaterMainWidget.dart';

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
      home: TapWaterMainWidget(isButton: true, btmNavbar: [
        {'title': '微信', 'icon': Icon(Icons.ac_unit)},
        {'title': '微信', 'icon': Icon(Icons.ac_unit)},
        {'title': '微信', 'icon': Icon(Icons.ac_unit)},
        {'title': '微信', 'icon': Icon(Icons.ac_unit)}
      ]),
    );
  }
}
