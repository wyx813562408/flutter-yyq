import 'package:flutter/material.dart';
import './pages/tabbars/bottom_tabbar_controller.dart';
import './utils/net_util.dart';
import 'package:fluro/fluro.dart';
import 'package:yyq_flutter/route/routes.dart';
import './Application.dart';
void main() {
  NetUtils.init();
  Router  router = Router();
  Routes.setConfigureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

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