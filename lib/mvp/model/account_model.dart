import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/http/http_util.dart';
import 'package:flutter_sd_play/utils/constants.dart';

class AccountModel{
  ///获取用户信息
  Future getUserInfo(Map<String, dynamic> params, Function(bool, Object) callBack) async {
    HttpUtil.instance.post(
        Constants.GET_ACCOUNT_INFO,
            (data) {
          callBack(true,UserAccount.fromJson(data));
        },
        params: params,
        errorCallBack: (errMsg) {
          print(errMsg);
          callBack(false,errMsg);
        });
  }


}