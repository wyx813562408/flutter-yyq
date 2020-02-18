import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
 class NetImageWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit boxFit;
  const NetImageWidget({Key key,@required this.url, this.width=200, this.height=200, this.boxFit= BoxFit.fill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width:width ,
      height:height ,
      fit: boxFit,
      placeholder: (context, url) => new Container(
        child: new Center(
          child: new CircularProgressIndicator(),
        ),
        width: width,
        height: height,
      ),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }
}
