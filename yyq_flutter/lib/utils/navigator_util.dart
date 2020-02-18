import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import '../route/routes.dart';
import '../Application.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  /// 漫画详情
  static void goComicDetail(BuildContext context,int comicId) {
    _navigateTo(context, '${Routes.comicDetail}?comicId=$comicId');
  }

//
  // /// 首页
  // static void goHomePage(BuildContext context) {
  //   _navigateTo(context, Routes.home, clearStack: true);
  // }

  // /// 每日推荐歌曲
  // static void goDailySongsPage(BuildContext context) {
  //   _navigateTo(context, Routes.dailySongs);
  // }

  // /// 每日推荐歌曲
  // static void goRankingListPage(BuildContext context) {
  //   _navigateTo(context, Routes.rankingList);
  // }

  // static void goPlaylistDetailPage(BuildContext context, int id){
  //   _navigateTo(context, '${Routes.playlistDetail}?listId=$id');

     
  // }
}
