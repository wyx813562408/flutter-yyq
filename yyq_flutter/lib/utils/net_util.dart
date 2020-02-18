
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../widgets/loading.dart';
import '../models/comic_detail_list_model.dart';
import '../models/comic_detail_simple.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = 'http://app.u17.com/v3/appV3_3/ios/phone/';

  static void init() async {

    _dio = Dio(BaseOptions(baseUrl: '$baseUrl', followRedirects: false,))
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  
    
      
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
   if (isShowLoading) Loading.showLoading(context);
    try {
      print('开始请求');
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
     //  UtilsToast.showToast(e.toString());
      if (e == null) {
        // _reLogin();
  
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
    
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          if(e.response.statusCode == 301){
          //  NavigatorUtil.goLoginPage(context);
          }
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      }else{
        return Future.error(Response(data: -1));
      }
    } finally {
      print('结束请求');
     Loading.hideLoading(context);
    }
  }


 // 

  //搜索
  static Future<ComicDetailListModel> getDetectListV4_5(
    BuildContext context, {
    Map<String, dynamic> params,
  }) async {
    var response =
        await _get(context, '/comic/getDetectListV4_5', params: params, isShowLoading: true);
    return ComicDetailListModel.fromJson(response.data);
  }

  ///漫画详情
  static Future<ComicDetailSimpleModel> getSingleComicDetail(
    BuildContext context, {
    Map<String, dynamic> params,
  }) async {
    var response =
        await _get(context, '/comic/getDetectListV4_5/detail_simple_dynamic', params: params, isShowLoading: false);
    return ComicDetailSimpleModel.fromJson(response.data);
  }



}
