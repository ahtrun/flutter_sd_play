import 'package:flutter_sd_play/mvp/base_presenter.dart';
import 'package:flutter_sd_play/mvp/model/account_model.dart';
import 'package:flutter_sd_play/mvp/model/login_model.dart';
import 'package:flutter_sd_play/mvp/model/version_model.dart';
import 'package:flutter_sd_play/mvp/view/setting_view.dart';

class SettingPresenter extends BasePresenter{
  AccountModel _accountModel;
  LoginModel _loginModel;
  VersionModel _versionModel;
  SettingView _view;


  SettingPresenter(this._view){
   _accountModel=new AccountModel();
   _versionModel=new VersionModel();
   _loginModel=new LoginModel();
  }

  ///登出
  Future logout() async {
    await _loginModel.logout({},
            (bool, result) {
          if (_view == null) {
            return;
          }
          if (bool) {
            _view.logoutSuccess();
          } else {
            _view.fail();
          }
        });
  }

  ///获取用户信息
  Future getUserAccount() async {
    await _accountModel.getUserInfo({},
            (bool, result) {
          if (_view == null) {
            return;
          }
          if (bool) {
            _view.getUserInfoSuccess(result);
          } else {
            _view.fail();
          }
        });
  }

  ///获取版本信息
  Future getVersion() async {
    await _versionModel.reqVersionInfo({"isOnlyVersion":true},
            (bool, result) {
          if (_view == null) {
            return;
          }
          if (bool) {
            _view.reqVersionSuccess(result);
          } else {
            _view.fail();
          }
        });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _view=null;
  }

}