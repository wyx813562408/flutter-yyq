import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:ui';
import 'package:yyq_flutter/utils/net_util.dart';
import 'package:yyq_flutter/widgets/widget_future_builder.dart';
import 'package:yyq_flutter/models/comic_detail_list_model.dart';
import 'package:yyq_flutter/widgets/common_text_style.dart';
import 'package:yyq_flutter/widgets/net_image_widget.dart';
import 'package:yyq_flutter/utils/color_util.dart';
import 'package:yyq_flutter/utils/navigator_util.dart';
const double app_bar_offset = 150;
double max_searach_width =
    (MediaQueryData.fromWindow(window).size.width - 32.0 - 32);

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  bool isTop = false;
  ScrollController _scrollController = new ScrollController();

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = new Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    // controller.forward();
    _scrollController.addListener(() {
      if (_scrollController.offset < app_bar_offset && isTop == true) {
        print('-------》下拉');
        setState(() {
          isTop = false;
        });
        controller.reverse();
      } else if (_scrollController.offset > app_bar_offset && isTop == false) {
        print('-------》上拉');
        setState(() {
          isTop = true;
        });
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
            //去掉顶部状态栏pading
            context: context,
            removeTop: true,
            child: Stack(
              children: <Widget>[
                ListView(
                  controller: _scrollController,
                  children: <Widget>[
                    CustomFutureBuilder(
                      futureFunc: NetUtils.getDetectListV4_5,
                      builder: (context, data) {
                        ComicDetailListModel model =
                            data as ComicDetailListModel;

                        return Column(
                          children: <Widget>[
                            BannerWidget(
                              galleryItems: model.data.returnData.galleryItems,
                            ),
                            ComicCategroyListWidget(
                                modules: model.data.returnData.modules)
                          ],
                        );
                      },
                    ),
                  ],
                ),
                //导航栏
                Container(
                    color: Color.fromRGBO(255, 255, 255, animation.value),
                    height: MediaQueryData.fromWindow(window).padding.top +
                        44 +
                        40 * (1 - animation.value),
                    padding: EdgeInsets.only(
                        top: MediaQueryData.fromWindow(window).padding.top),
                    child: Padding(
                      padding: EdgeInsets.only(top: 40 * (1 - animation.value)),
                      child: Container(
                        margin: EdgeInsets.only(
                            left:
                                (MediaQueryData.fromWindow(window).size.width -
                                        150) *
                                    animation.value),
                        height: 44,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            AppBarItem(
                              colorT: animation.value,
                            ),
                            AppBarItem(
                              colorT: animation.value,
                            ),
                            AppBarItem(
                              colorT: animation.value,
                            ),
                            AppBarItem(
                              colorT: animation.value,
                            )
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
                          child: Icon(IconData(0xe61b, fontFamily: 'iconfont'),
                              color: Color.lerp(Colors.white, Colors.lightBlue,
                                  animation.value),
                              size: 24.0),
                        ),

                        ClipRRect(
                          child: Container(
                            height: 32,
                            width: 100 +
                                (max_searach_width - 100) *
                                    (1 - animation.value),
                            color: Color.lerp(
                                Color.fromRGBO(245, 245, 245, 0.5),
                                Color.fromRGBO(245, 246, 247, 1),
                                animation.value),
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  color: Color.lerp(
                                      Color.fromRGBO(255, 255, 255, 1),
                                      Color.fromRGBO(102, 102, 102, 0.7),
                                      animation.value),
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
                                            animation.value)),
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

  void _onScroll(offset) {}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

//轮播广告
class BannerWidget extends StatelessWidget {
  final List<GalleryItem> galleryItems;
  const BannerWidget({Key key, this.galleryItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(750 / (1242 / 1200)),
      
      child: new Swiper(
           onTap: ((index){
             NavigatorUtil.goComicDetail(context,galleryItems[index].id);
           }),
          itemBuilder: (BuildContext context, int index) {
            
            return Stack(
              children: <Widget>[
                ClipPath(
                  //路径裁切组件
                  clipper: BottomClipper(), //路径
                  child: Image.network(galleryItems[index].cover),
                ),
                new Image.network(
                  galleryItems[index].topCover,
                  fit: BoxFit.fill,
                )
              ],
            );
          },
          autoplay: true,
          itemCount: galleryItems.length,
          pagination: new SwiperPagination(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(16),
              builder: DotSwiperPaginationBuilder(color: Colors.grey)),
          scale: 1.0),
    );
  }
}

//导航栏
class AppBarItem extends StatelessWidget {
  final double colorT;
  const AppBarItem({Key key, this.colorT = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //   child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              margin: EdgeInsets.only(right: 4),
              alignment: Alignment.centerRight,
              child: Icon(IconData(0xe61b, fontFamily: 'iconfont'),
                  color: Color.lerp(Colors.white, Colors.lightBlue, colorT),
                  size: 20.0),
            )),
            colorT < 0.85
                ? Expanded(
                    child: Text(
                      '排行',
                      style: TextStyle(
                        color:
                            Color.lerp(Colors.white, Colors.lightBlue, colorT),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : Container(
                    width: 8,
                  )
          ],
        ),

        //)
      ),
    );
  }
}

//列表数据
class ComicCategroyListWidget extends StatelessWidget {
  final List<Module> modules;

  const ComicCategroyListWidget({Key key, @required this.modules})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = -1;
    double pading = ScreenUtil().setWidth(32);
    return Container(
      padding: EdgeInsets.fromLTRB(pading, 0, pading, pading),
      child: Column(
        children: modules.map((item) {
          index++;
          return ComicCategroyWidget(
            module: item,
            index: index,
          );
        }).toList(),
      ),
    );
  }
}

class ComicCategroyWidget extends StatelessWidget {
  final int index;
  final Module module;
  const ComicCategroyWidget(
      {Key key, @required this.module, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 8,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                (module.moduleType == 2 && module.uiType == 1)
                    ? Container()
                    : Image.network(
                        module.moduleInfo.icon,
                        width: ScreenUtil().setWidth(48),
                      ),
                (module.moduleType == 2 && module.uiType == 1)
                    ? Container()
                    : Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                          child: Text(
                            module.moduleInfo.title,
                            style: bold24TextStye,
                          ),
                        ),
                      )
              ],
            ),
            _getDiscoverBox(index, module)
          ],
        ));
  }

  Widget _getDiscoverBox(int index, Module module) {
    List<Widget> widgets = [Container()];
    switch (module.moduleType) {
      case 1:
        if (index == 0) {
          widgets = module.discoveryItems.map((item) {
            return Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(16)),
              child: Container(
                width: ScreenUtil().setWidth(335),
                child: ComicCard(
                  item: item.list[0],
                ),
              ),
            );
          }).toList();
        } else {
          int style = 2;
          int itemIndex = -1;
          double width = 218;
          widgets = module.discoveryItems.map((item) {
            itemIndex = itemIndex + 1;
            // print(itemIndex);
            if (itemIndex == 0 && module.discoveryItems.length == 5) {
              style = 1;
              width = 452;
            } else {
              style = 2;
              width = 218;
            }
            return Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(16)),
              child: Container(
                width: ScreenUtil().setWidth(width),
                child: ComicCard(
                  item: item.list[0],
                  style: style,
                ),
              ),
            );
          }).toList();
        }

        break;

      default:
    }
    if (module.moduleType == 1) {
      return Wrap(
          spacing: ScreenUtil().setWidth(16),
          alignment: WrapAlignment.start,
          children: widgets);
    } else if (module.moduleType == 2) {
      if (module.uiType == 1) {
        return Container(
            margin: EdgeInsets.fromLTRB(
                0, ScreenUtil().setWidth(32), 0, ScreenUtil().setWidth(32)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: NetImageWidget(
                url: module.advItems.first.cover,
                width: ScreenUtil().setWidth(750 - 64),
                height: ScreenUtil().setWidth(586 / (1242 / 414)),
              ),
            ));
      } else {
        return Container(
          margin: EdgeInsets.fromLTRB(
              0, ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16)),
          height: ScreenUtil().setWidth(500 / (966 / 718)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: module.advItems.length,
              //itemExtent: 50.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(
                          index == module.advItems.length - 1 ? 0 : 16)),
                  child: NetImageWidget(
                    url: module.advItems[index].cover,
                    width: ScreenUtil().setWidth(500),
                    height: ScreenUtil().setWidth(500 / (966 / 718)),
                  ),
                );
              }),
        );
      }
    } else if (module.moduleType == 3) {
      return Container(
        margin: EdgeInsets.fromLTRB(
            0, ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16)),
        height: ScreenUtil().setWidth(500 / (1242 / 730)),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: module.commentItems.length,
            itemBuilder: (BuildContext context, int index) {
              // Padding(padding: null)
              return Padding(
                  padding: EdgeInsets.only(
                      right: index == module.commentItems.length - 1 ? 0 : 16),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                        width: ScreenUtil().setWidth(500),
                        height: ScreenUtil().setWidth(500 / (1242 / 730)),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(module.commentItems[index].cover),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Opacity(
                          opacity: 0.8,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ColorsUtil.hexColor(int.parse('0x' +
                                      module.commentItems[index].upperColor)),
                                  ColorsUtil.hexColor(int.parse('0x' +
                                      module.commentItems[index].lowerColor))
                                ],
                              ),
                            ),
                            child: _getCommentView(module.commentItems[index]),
                          ),
                        ),
                      )));

              // Padding(
              //   padding:
              //   child: NetImageWidget(url: module.commentItems[index].cover,width: ScreenUtil().setWidth(500),height: ScreenUtil().setWidth(500/(1242/730)),),
              // );
            }),
      );
    } else if (module.moduleType == 4) {
      return Container(
        margin: EdgeInsets.fromLTRB(
            0, ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16)),
        height: ScreenUtil().setWidth(300 / (520 / 678)),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: module.animationItems.length,
            //itemExtent: 50.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(
                          index == module.animationItems.length - 1 ? 0 : 16)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: NetImageWidget(
                          url: module.animationItems[index].cover,
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setWidth(300 / (520 / 678)),
                        ),
                      ),
                      Positioned(
                        child: Icon(IconData(0xe61b, fontFamily: 'iconfont'),
                            color: Colors.white, size: 40.0),
                      )
                    ],
                  ));
            }),
      );
    } else
    if (module.moduleType == 5) {
      return _getRewardView(module.rewardItems);
    }
    return Container();
  }

  Widget _getRewardView(List<RewardItem> rewards) {


    return Container(
      margin: EdgeInsets.only(top:ScreenUtil().setWidth(10),bottom:ScreenUtil().setWidth(10)),
      height: ScreenUtil().setWidth(360),
      child: new Swiper(
        viewportFraction: 1,
        itemBuilder: (BuildContext context, int index) {
          return RewardCard(
            reward: rewards[index],
          );
        },
        customLayoutOption:
            new CustomLayoutOption(startIndex: 0, stateCount: 3).addTranslate([
          new Offset(0.0, -ScreenUtil().setWidth(100)),
          new Offset(0.0, ScreenUtil().setWidth(80)),
          new Offset(0.0, ScreenUtil().setWidth(260))
        ]),
        loop: true,
        scrollDirection: Axis.vertical,
        autoplay: true,
        itemHeight: ScreenUtil().setWidth(160),
        itemWidth: ScreenUtil().setWidth(686),
        layout: SwiperLayout.CUSTOM,
        itemCount: rewards.length,
        autoplayDisableOnInteraction: false,
        scale: 1,
      ),
    );
  }

  Widget _getCommentView(CommentItem comment) {
    TextStyle style1 = TextStyle(
        color: Colors.white,
        fontSize: ScreenUtil().setSp(24),
        fontWeight: FontWeight.bold);
    TextStyle style2 =
        TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(16));
    return Container(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(32),
            ScreenUtil().setWidth(16),
            ScreenUtil().setWidth(32),
            ScreenUtil().setWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '《' + comment.comicName + '》',
              style: TextStyle(color: Colors.white),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '"',
                  style: style1,
                )),
            Text(
              comment.comment,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: style2,
            ),
            Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '"',
                  style: style1,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('来自于', style: style2),
                Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(8),
                        right: ScreenUtil().setWidth(8)),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(15)),
                        child: NetImageWidget(
                          url: comment.user.cover,
                          width: ScreenUtil().setWidth(30),
                          height: ScreenUtil().setWidth(30),
                        ))),
                Text(comment.user.nickname, style: style2)
              ],
            )
          ],
        ));
  }
}

class RewardCard extends StatelessWidget {
  final RewardItem reward;
  const RewardCard({Key key, @required this.reward}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <List<Color>> colors = [[Color.fromRGBO(255,154,158, 1), Color.fromRGBO(250,208,196,1)],
        [Color.fromRGBO(161,140,209, 1), Color.fromRGBO(251,194,235,1)],
       [ Color.fromRGBO(166,192,254 ,1) , Color.fromRGBO(246,128,132, 1)],
         [Color.fromRGBO(168,237,234, 1), Color.fromRGBO(254,214,227,1)],
        ];
      int bgcolor = 0;  
     switch (reward.giftName) {
       case '可乐':
         bgcolor = 0;
         break;
       case '鸡腿':
         bgcolor = 1;
         break;
       case '月票':
         bgcolor =2;
         break;
       case '':
       case '快乐水':
         bgcolor =2;
         break;
         
         break;      
       default:
     } 

   
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            // color: Colors.deepOrange,
            padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(40),
              left:  ScreenUtil().setWidth(20),
            ),
            child: Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(100), right: ScreenUtil().setWidth(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      reward.nickname,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('给《${reward.comicName}》送了',style: TextStyle(color: Colors.white),),
                        NetImageWidget(url: reward.giftIcon,width: ScreenUtil().setWidth(40),height: ScreenUtil().setWidth(40),),
                        Text('x ',style: TextStyle(color: Colors.white)),
                        Text('${reward.giftCount}',style: TextStyle(color: Colors.white)),
                      ],
                    ),
                   
                  ],
                ),
                height: ScreenUtil().setWidth(120),
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      colors: colors[bgcolor]),
                    border: new Border.all( color: Colors.white, width: 0.5), // 边色与边宽度
                 //   gradient:colors[bgcolor] ,// 底色
                    // borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                    borderRadius: new BorderRadius.all(Radius.circular(30)))),
          ),
          Positioned(
            child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: NetImageWidget(
                    url: reward.cover,
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setWidth(80),
                    boxFit: BoxFit.fitWidth,
                  ),
                ),
                decoration: new BoxDecoration(
                    border:
                        new Border.all(color: Colors.white, width: 1), // 边色与边宽度
                    // 底色
                    // borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                    borderRadius: new BorderRadius.all(Radius.circular(25)))),
            left: ScreenUtil().setWidth(40),
            top: 0,
          ),
        ],
      ),
    );
  }
}

class ComicCard extends StatelessWidget {
  final int style;
  final ComicItem item;
  const ComicCard({Key key, @required this.item, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil().setWidth(335);
    double height = ScreenUtil().setWidth(335 / (1242 / 730));
    if (this.style == 1) {
      width = ScreenUtil().setWidth(452);
      height = ScreenUtil().setWidth(218 / (484 / 639));
    } else if (this.style == 2) {
      width = ScreenUtil().setWidth(218);
      height = ScreenUtil().setWidth(218 / (484 / 639));
    }
    return GestureDetector(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: NetImageWidget(
              url: item.cover,
              boxFit: BoxFit.fill,
              width: width,
              height: height,
            )),
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(8), bottom: ScreenUtil().setWidth(8)),
          child: Text(
            item.title,
            style: bold20TextStye,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          item.subTitle,
          style: common14GrayTextStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
    onTap: (){
      NavigatorUtil.goComicDetail(context,item.comicId);
    },
    );
  }
}

//banner 背景切割绘制路径
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height - ScreenUtil().setWidth(100.0)); //第2个点
    var firstControlPoint =
        Offset(size.width / 5 * 2, size.height + ScreenUtil().setWidth(80));
    var firstEdnPoint =
        Offset(size.width, size.height - ScreenUtil().setWidth(200.0));
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEdnPoint.dx, firstEdnPoint.dy);
    path.lineTo(size.width, size.height - ScreenUtil().setWidth(200.0)); //第3个点
    path.lineTo(size.width, 0); //第4个点

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
