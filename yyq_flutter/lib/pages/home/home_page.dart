import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:ui';

double app_bar_offset = 150;

double max_searach_width =
    (MediaQueryData.fromWindow(window).size.width - 32 - 32);

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  double appBarAlpha = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
            //去掉顶部状态栏pading
            context: context,
            removeTop: true,
            child: Stack(
              children: <Widget>[
                NotificationListener(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification &&
                          scrollNotification.depth == 0) {
                        //当监听对象为滚动事件切是当前第一个子节点
                        _onScroll(scrollNotification.metrics.pixels);
                      }
                    },
                    child: ListView(
                      children: <Widget>[
                        BannerWidget(),
                      ],
                    )),
                Container(
                    color: Color.fromRGBO(255, 255, 255, appBarAlpha),
                    height: MediaQueryData.fromWindow(window).padding.top +
                        44 +
                        40 * (1 - appBarAlpha),
                    padding: EdgeInsets.only(
                        top: MediaQueryData.fromWindow(window).padding.top),
                    child: Padding(
                      padding: EdgeInsets.only(top: 40 * (1 - appBarAlpha)),
                      child: Container(
                        margin: EdgeInsets.only(left: (MediaQueryData.fromWindow(window).size.width -150) *appBarAlpha),
                        height: 44,
                     
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                              AppBarItem(colorT: appBarAlpha,),
                              AppBarItem(colorT: appBarAlpha,),
                              AppBarItem(colorT: appBarAlpha,),
                              AppBarItem(colorT: appBarAlpha,)
                          ],
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQueryData.fromWindow(window).padding.top,
                        left: 16,
                        right: 16),
                    height: 44,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(IconData(0xe611, fontFamily: 'iconfont'),
                              color: Color.lerp(
                                  Colors.white, Colors.lightBlue, appBarAlpha),
                              size: 24.0),
                        ),
                        // Expanded(
                        //   child:
                        ClipRRect(
                          child: Container(
                            height: 32,
                            width: 100 +
                                (max_searach_width - 100) * (1 - appBarAlpha),
                            color: Color.lerp(
                                Color.fromRGBO(245, 245, 245, 0.5),
                                Color.fromRGBO(245, 246, 247, 1),
                                appBarAlpha),
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  color: Color.lerp(
                                      Color.fromRGBO(255, 255, 255, 1),
                                      Color.fromRGBO(102, 102, 102, 0.7),
                                      appBarAlpha),
                                  size: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    '搜索',
                                    style: TextStyle(
                                        color: Color.lerp(
                                            Color.fromRGBO(255, 255, 255, 1),
                                            Color.fromRGBO(102, 102, 102, 0.7),
                                            appBarAlpha)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        )
                        // )
                      ],
                    ))
              ],
            )));
  }

  void _onScroll(offset) {
    double alpha = offset / app_bar_offset;
    if (alpha > 1) {
      alpha = 1;
    } else if (alpha < 0) {
      alpha = 0;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579177114657&di=d8d47354e05f1d35aae48604f290e007&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F39e090f30e7ea290f32c0a7053b8e192311cde8083e5-oXG8Pn_fw658",
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: 3,
          pagination: new SwiperPagination(),
          scale: 1.5),
    );
  }
}


class AppBarItem extends StatelessWidget {
  final  double colorT ;
  const AppBarItem({Key key, this.colorT = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

   //   child: Expanded(
        child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(IconData(0xe611, fontFamily: 'iconfont'),
                              color: Color.lerp(
                                  Colors.white, Colors.lightBlue, colorT),
                              size: 20.0),
           Expanded(
             child: Text('排行',style: TextStyle(
                color:Color.lerp( Colors.white, Colors.lightBlue, colorT),  ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis ,
                ),
           )
          ],
        ),
      //)
    ),
    );
  }
}
