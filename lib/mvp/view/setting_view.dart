import 'package:flutter_sd_play/entity/sys_ver.dart';
import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/mvp/base_view.dart';

abstract class SettingView extends BaseView{
  void getUserInfoSuccess(UserAccount account);

  void logoutSuccess();

  void reqVersionSuccess(SysVer version);
}