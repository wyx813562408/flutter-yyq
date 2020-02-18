import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yyq_flutter/utils/net_util.dart';
import 'package:yyq_flutter/widgets/net_image_widget.dart';
import '../../models/comic_detail_simple.dart';
import 'dart:ui';
import '../../widgets/flexible_detail_bar.dart';

class ComicDetailPage extends StatefulWidget {
  final String comicId;
  ComicDetailPage({Key key, @required this.comicId}) : super(key: key);

  @override
  _ComicDetailPageState createState() => _ComicDetailPageState();
}

class _ComicDetailPageState extends State<ComicDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // NetUtils.getSingleComicDetail(context,params: {
    //   'comicid':widget.comicId
    // }).then((ComicDetailSimpleModel model){
    //   print(model.data.returnData.comic.name);
    // });
    // print('model.data.returnData.comic.name');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              title: Text('详情'),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            preferredSize: Size.fromHeight(40)),
        body: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              CustomHead(),
              Positioned(
                  top: 0,
                  bottom: 64,
                  left: 0,
                  right: 0,
                  child: Transform.translate(
                      offset: Offset(
                          0,
                          ScreenUtil().setWidth(540)-(MediaQueryData.fromWindow(window).padding.top +
                              40)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Container(
                            color: Colors.white,
                            child: ListView.builder(
                                itemCount: 100,

                                //强制高度为50.0
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 50,
                                    color: Colors.white,
                                    child: Text('$index'),
                                  );
                                })),
                      )))
            ],
          ),
        ));
  }
}

class CustomHead extends StatelessWidget {
  const CustomHead({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -(MediaQueryData.fromWindow(window).padding.top + 40)),
      child: Container(
        height: ScreenUtil().setWidth(540),
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Image.network(
              'http://cover.u17i.com/2017/07/2292096_1499323841_2UhpYUAa2pWu.ubig.jpg',
              height: ScreenUtil().setWidth(440),
            ),
            ClipRRect(
              child: Container(
                height: ScreenUtil().setWidth(100),
                color: Colors.white,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            )
          ],
        ),
      ),
    );
  }
}