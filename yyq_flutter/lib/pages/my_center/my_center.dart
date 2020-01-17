import 'package:flutter/material.dart';

class MyCenterPage extends StatefulWidget {
  MyCenterPage({Key key}) : super(key: key);

  @override
  _MyCenterPageState createState() => _MyCenterPageState();
}

class _MyCenterPageState extends State<MyCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('个人中心'),
    );
  }
}