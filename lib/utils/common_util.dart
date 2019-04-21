import 'dart:ui';

import 'package:flutter/material.dart';

class CommonUtil {
  static int getDisplayWidth(Window window) {
    return 0;
  }

  /// 创建一个平移变换
  /// 跳转过去查看源代码，可以看到有各种各样定义好的变换
  static SlideTransition inTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }

  /// 创建一个平移变换
  /// 跳转过去查看源代码，可以看到有各种各样定义好的变换
  static SlideTransition outTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(1.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }

  static Future start(BuildContext context, Widget widget) {
    return Navigator.of(context).push(new PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        // 添加一个平移动画
        return inTransition(animation, child);
      },
    ));
  }

  static void exit(BuildContext context, Widget widget) {
    Navigator.of(context).pop(
      new PageRouteBuilder(pageBuilder: (BuildContext context,
          Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      }, transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        // 添加一个平移动画
        return outTransition(animation, child);
      }),
    );
  }

  static bool isEmpty(String str) {
    // 判断为空
    if (str == null || str.isEmpty) {
      return true;
    }
    return false;
  }

  //检验手机号码是否有效
  static bool isMobile(String str) {
    if (isEmpty(str)) {
      return false;
    }
    if (str.length != 11) {
      return false;
    }
    if (!str.startsWith("1")) {
      return false;
    }
//    if(!isNumericStr(str)){
//      return false;
//    }
    return true;
  }

//判断是否是纯数字字符串
//   static bool isNumericStr(String str){
//    return new RegExp('.*[\d].*').hasMatch(str);
//  }



}
