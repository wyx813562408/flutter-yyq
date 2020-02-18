import 'package:flutter/material.dart';
import '../../utils/net_util.dart';
class MyCenterPage extends StatefulWidget {
  MyCenterPage({Key key}) : super(key: key);

  @override
  _MyCenterPageState createState() => _MyCenterPageState();
 
}

class _MyCenterPageState extends State<MyCenterPage> {
  String data ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       child: InkWell(
         child: Text('获取数据'),
         onTap: (){
          
           NetUtils.getDetectListV4_5(context);
         },
       )
    ),
    );
  }
}