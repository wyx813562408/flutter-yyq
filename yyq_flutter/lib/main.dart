import 'package:flutter/material.dart';
import './pages/tabbars/bottom_tabbar_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomTabbarController(),
    );
  }
}

// class Tabbar extends StatelessWidget {
//   final List<Map> tabbars;
//   const Tabbar({Key key,@required this.tabbars}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//        appBar: PreferredSize(
//           child: AppBar(),
//           preferredSize: Size.zero,
//         ),
//         body: SafeArea(
//          child: Center(child: Text(data),),
//         ),

//       ),
//     );
//   }
// }