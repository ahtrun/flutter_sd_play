import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/mvp/base_presenter.dart';
import 'package:flutter_sd_play/mvp/model/login_model.dart';
import 'package:flutter_sd_play/mvp/view/login_view.dart';
import 'package:flutter_sd_play/utils/common_util.dart';
import 'package:flutter_sd_play/utils/constants.dart';
import 'package:flutter_sd_play/utils/share_preferences_util.dart';

class LoginPresenter extends BasePresenter {
  LoginView _view;
  LoginModel _model;

  LoginPresenter(this._view) {
    _model = new LoginModel();
  }

  ///发送短信
  Future sendMessage(String phoneNumber, String type) async {
    await _model.sendMessage({"mobile": phoneNumber, "type": type},
        (bool, result) {
      if (_view == null) {
        return;
      }
      if (bool) {
        _view.sendMessageSuccess();
      } else {
        _view.sendMessageFail();
      }
    });
  }

  ///登录
  Future login(
    String phoneNumber,
    String msg,
    String loginType,
  ) async {
    await _model.login({
      "mobile": phoneNumber,
      "loginType": "sms",
      "clientType": "5",
      "captcha": msg
    }, (bool, result) {
      if (_view == null) {
        return;
      }
      if (bool) {
        UserAccount userAccount=result;
        SPUtil.putString(Constants.INVITE_CODE, userAccount.randomCode);
        SPUtil.putString(Constants.PHONE_NUMBER, phoneNumber);

        if (userAccount != null) {
          if (!userAccount.needBindParentUser) {
            //已绑定上级
            if (userAccount != null) {
              if (CommonUtil.isEmpty(userAccount.nickName)) {
                SPUtil.putString(Constants.NICK_NAME, userAccount.userName);
              } else {
                SPUtil.putString(Constants.NICK_NAME, userAccount.userName);
              }
              SPUtil.putString(Constants.USER_HEADIMG, userAccount.headUrl);
              SPUtil.putBool(Constants.ISLOGIN, true);
              SPUtil.putBool(Constants.ISLOGIN_FIRST, true);
              SPUtil.putInt(Constants.IFBILLVIP, userAccount.ifBillVip);
            }
//          BBCUtil.syncLogin(activity);
          }
          _view.loginSuccess(userAccount);
        } else {
          _view.fail();
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _view = null;
  }
}
