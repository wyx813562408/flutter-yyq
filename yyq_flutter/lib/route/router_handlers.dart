
import 'package:flutter/widgets.dart';
import 'package:fluro/fluro.dart';

import '../pages/comic_detail/comic_detail.dart';
import '../pages/tabbars/bottom_tabbar_controller.dart';
import '../pages/comic_detail/comic_detail.dart';
import '../models/comic_detail_list_model.dart';

// import '../pages/home_page/home_page.dart';
// import '../pages/dayily_songs/dayily_song_page.dart';
// import '../pages/ranking_list/ranking_list.dart';
// import '../pages/playlist_datail/playlist_detail_page.dart';


var rootTabbarHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String, List<Object>> params){
    return BottomTabbarController();
  }
);

var comicDetailHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String, List<Object>> params){
    print(params);
    
    return ComicDetailPage(comicId: params['comicId'][0], );
  });

// var loginHandler = new Handler(
//   handlerFunc: (BuildContext context,Map<String,List<Object>> params){
//     return LoginPage();
//   }
// );

// var homeHander = new Handler(
//   handlerFunc: (BuildContext context,Map<String,List<Object>> params){
//     print('跳转参数------>');
//     print(params.toString());
//     return HomePage();
//   }
// );

// var dayilySongsHander = new Handler(
//   handlerFunc: (BuildContext context,Map<String,List<Object>> params){
//     return DaliySongsPage();
//   }
// );

// var rankingListHander = new Handler(
//   handlerFunc: (BuildContext context,Map<String,List<Object>> params){
//     return RankingListPage();
//   }
// );

// var playlistDetailHander = new Handler(
//   handlerFunc: (BuildContext context,Map<String,List<Object>> params){
//    String data = params['listId'].first;
 
//     return PlaylistDetailPage(playlistId: int.parse(data));
//   }
// );