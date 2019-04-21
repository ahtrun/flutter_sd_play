
import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/http/http_util.dart';
import 'package:flutter_sd_play/utils/constants.dart';

class LoginModel{

  ///发送短信
  Future sendMessage(Map<String, dynamic> params, Function(bool, Object) callBack) async {
    HttpUtil.instance.post(
        Constants.UPDATE_MOBILE_SENDSMS,
            (data) {
          callBack(true,"");
        },
        params: params,
        errorCallBack: (errMsg) {
          print(errMsg);
          callBack(false,errMsg);
        });
  }

  ///登录
  Future login(Map<String, dynamic> params, Function(bool, Object) callBack) async {
    HttpUtil.instance.post(
        Constants.REQ_LOGIN_NEW,
            (data) {
              callBack(true,UserAccount.fromJson(data));
        },
        params: params,
        errorCallBack: (msg) {
          print(msg);
        });
  }



}