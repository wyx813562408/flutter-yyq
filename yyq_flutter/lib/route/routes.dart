import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yyq_flutter/pages/tabbars/bottom_tabbar_controller.dart';
import './router_handlers.dart';

class Routes {
  static String root = '/';
  static String comicDetail = '/comic_detail';


  static void setConfigureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('路径找不到');
      return BottomTabbarController();
    });
    router.define(root, handler: rootTabbarHandler);
    router.define(comicDetail, handler: comicDetailHandler);
  }
}
