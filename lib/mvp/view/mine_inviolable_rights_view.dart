import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/mvp/base_view.dart';

abstract class MineInviolableRightsView extends BaseView{

  void queryUserInfoSuccess(UserAccount account);

}