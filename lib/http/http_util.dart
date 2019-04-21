import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_sd_play/utils/common_util.dart';
import 'package:flutter_sd_play/utils/constants.dart';
import 'package:flutter_sd_play/utils/share_preferences_util.dart';
import 'package:package_info/package_info.dart';
class HttpUtil {
  static const String GET = "get";
  static const String POST = "post";
  final Dio dio= new Dio();

  // 工厂模式
//  factory HttpUtil() =>_getInstance();
  static HttpUtil get instance => _getInstance();
  static HttpUtil _instance;

  HttpUtil._internal() {
    // 初始化
    // 配置dio实例
    dio.options.baseUrl = Constants.HOST;
    dio.options.connectTimeout = 15000; //5s
    dio.options.receiveTimeout = 13000;
  }

  static HttpUtil _getInstance() {
    if (_instance == null) {
      _instance = new HttpUtil._internal();
    }
    return _instance;
  }

  //get请求
//  void get(String url, Function callBack,
//      {Map<String, String> params, Function errorCallBack}) async {
//    _request(Constants.HOST+url, callBack,
//        method: GET, params: params, errorCallBack: errorCallBack);
//  }

  void post(String url, Function callBack,
      {Map<String, dynamic> params, Function errorCallBack}) async {
    if(params==null){
      params={};
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    params['version']='${packageInfo.version}';
    FormData formData = new FormData.from(params);
    Map<String, dynamic> headers = new Map();

    try {
      Options options;
      String cookie= await SPUtil.getString(Constants.COOKIE);
     if(!CommonUtil.isEmpty(cookie)){
       headers['Cookie'] = cookie;
       options = new Options(
           headers:headers
       );
     }
      Response response = await dio.post(url, data: formData,options: options);
      print("");
      response.headers.forEach((str,list){
        if(str.startsWith("set-cookie")){
          list.forEach((value){
            if (value.contains("JSSIONID=")) {
              int start = value.indexOf("JSSIONID=");
              int end = value.indexOf(";");
              SPUtil.putString(Constants.COOKIE, value.substring(start, end));

            }
          });
        }
      });
      int statusCode = response.statusCode;
      //处理错误部分
      if (statusCode < 0) {
        _handError(errorCallBack, "网络请求错误,状态码:" + statusCode.toString());
        return;
      }
      Map<String, dynamic> map = json.decode(response.data);
      if (callBack != null&&map['success']) {
        callBack(map["result"]);
        print("<net> response data:" + map["result"].toString());
      }else{
        errorCallBack(map['message']);
      }
    }catch(e) {
      errorCallBack(e);
    }
  }



//  //具体的还是要看返回数据的基本结构
//  //公共代码部分
//  void _request(String url, Function callBack,
//      {String method,
//      Map<String, String> params,
//      Function errorCallBack}) async {
//    print("<net> url :<" + method + ">" + url);
//    if (params != null && params.isNotEmpty) {
//      print("<net> params :" + params.toString());
//    }
////    else {
////      params = Map<String, String>();
////    }
////    params["versionAndr"] = "2000";
//    String errorMsg = "";
//    int statusCode;
//
//    try {
//      Response response;
//      if (method == GET) {
//        //组合GET请求的参数
//        response = await dio.get(url,data: params);
//      } else {
//        if (params != null && params.isNotEmpty) {
//          response = await dio.post(url, data: params);
//        } else {
//          response = await dio.post(url);
//        }
//      }
//
//      statusCode = response.statusCode;
//
//      //处理错误部分
//      if (statusCode < 0) {
//        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
//        _handError(errorCallBack, errorMsg);
//        return;
//      }
//
//      if (callBack != null) {
//        callBack(response.data["data"]);
//        print("<net> response data:" + response.data["data"]);
//      }
//    } catch (exception) {
//      _handError(errorCallBack, exception.toString());
//    }
//  }

  //处理异常
  void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }
}
