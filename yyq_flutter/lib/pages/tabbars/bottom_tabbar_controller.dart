import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yyq_flutter/pages/books/book_page.dart';
import 'package:yyq_flutter/pages/categroy/categroy_page.dart';
import 'package:yyq_flutter/pages/home/home_page.dart';
import 'package:yyq_flutter/pages/my_center/my_center.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomTabbarController extends StatefulWidget {
  BottomTabbarController({Key key}) : super(key: key);

  @override
  _BottomTabbarControllerState createState() => _BottomTabbarControllerState();
}

class _BottomTabbarControllerState extends State<BottomTabbarController> {
  int selectBar = 0;

  List<BottomNavigationBarItem> tabbars = [
    BottomNavigationBarItem(
      title: Text('首页'),
      icon: Icon(CupertinoIcons.home),
    ),
    BottomNavigationBarItem(
      title: Text('分类'),
      icon: Icon(CupertinoIcons.home),
    ),
    BottomNavigationBarItem(
      title: Text('书架'),
      icon: Icon(CupertinoIcons.home),
    ),
    BottomNavigationBarItem(
      title: Text('我的'),
      icon: Icon(CupertinoIcons.home),
    )
  ];
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
      ScreenUtil.init(context,width: 750,height: 1080);
    return Scaffold(
     
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: tabbars,
        currentIndex: selectBar,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selectBar = index;
          });
        },
      ),
      body:  PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          HomePage(),
          BookPage(),
          CategroyPage(),
          MyCenterPage(),
        ],
      ),
    );
  }
}
