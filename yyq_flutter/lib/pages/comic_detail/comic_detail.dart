import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yyq_flutter/widgets/net_image_widget.dart';
import 'package:yyq_flutter/widgets/widget_future_builder.dart';
import 'package:yyq_flutter/utils/net_util.dart';
import 'package:yyq_flutter/models/comic_detail_simple.dart';
import 'package:yyq_flutter/utils/color_util.dart';
import '../../utils/net_util.dart';

class ComicDetailPage extends StatefulWidget {
  final String comicId;
  ComicDetailPage({Key key, this.comicId}) : super(key: key);

  @override
  _ComicDetailPageState createState() => _ComicDetailPageState();
}

class _ComicDetailPageState extends State<ComicDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomFutureBuilder(
            futureFunc: NetUtils.getSingleComicDetail,
            params: {'comicid': widget.comicId},
            builder: (context, data) {
              ComicDetailSimpleModel model = data as ComicDetailSimpleModel;
              var sliverCustomHeaderDelegate = SliverCustomHeaderDelegate(
                  title: '哪吒之魔童降世',
                  collapsedHeight: 40,
                  expandedHeight: ScreenUtil().setWidth(750 / (1232 / 730)),
                  paddingTop: MediaQuery.of(context).padding.top,
                  coverImgUrl: model.data.returnData.comic.wideCover,
                  comic: model.data.returnData.comic);

              return CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: sliverCustomHeaderDelegate,
                  ),
                  SliverFillRemaining(
                    child: FilmContent(),
                  )
                ],
              );
            }));
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
  final Comic comic;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    this.comic,
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    //设置系统状态栏颜色
    // if(shrinkOffset > 50 && this.statusBarMode == 'dark') {
    //   this.statusBarMode = 'light';
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.light,
    //   ));
    // } else if(shrinkOffset <= 50 && this.statusBarMode == 'light') {
    //   this.statusBarMode = 'dark';
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark,
    //   ));
    // }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();

    return Color.fromARGB(alpha, 15, 240, 39);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 255, 255, 255);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);

    TextStyle comicNameTS =
        TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(24));
    TextStyle authorTS =
        TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(16));
       TextStyle themeIdTS =
        TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(18)); 
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
               
              decoration: BoxDecoration(
                
               
                image: DecorationImage(
                  image: NetworkImage(
                    this.coverImgUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(child: Opacity(opacity: 0.3,
                    child: Container(
                   color:  ColorsUtil.hexToColor(comic.wideColor),
                  ),
                  ),
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                child: Container(
                                  decoration: new BoxDecoration(
                                      border: new Border.all(
                                          color: Colors.white, width: 2)),
                                  child: Image.network(comic.cover,
                                      width: ScreenUtil().setWidth(161),
                                      height: ScreenUtil().setWidth(213)),
                                )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                comic.name,
                                style: comicNameTS,
                              ),
                              Text(
                                comic.author.name,
                                style: authorTS,
                              ),
                              Row(
                                children: comic.themeIds.map((f) => 
                                      Container(
                                        padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                                        margin: EdgeInsets.only(right:16),
                                          decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: new Border.all(
                                                  color: Colors.white,
                                                  width: 2)),
                                          child: Text(f,style: themeIdTS,),
                                        ))
                                    .toList(),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilmContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://img1.gamersky.com/image2019/07/20190725_ll_red_136_2/gamersky_07small_14_201972510258D0.jpg',
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 16)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '哪吒之魔童降世',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    '动画/中国大陆/110分钟',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    '2019-07-26 08:00 中国大陆上映',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    '32.1万人想看/大V推荐度95%',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '剧情简介',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                '天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和魔丸竟然被掉包。本应是灵珠英雄的哪吒却成了混世大魔王。调皮捣蛋顽劣不堪的哪吒却徒有一颗做英雄的心。然而面对众人对魔丸的误解和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
