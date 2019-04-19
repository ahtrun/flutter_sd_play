import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/mvp/base_view.dart';

abstract class LoginView extends BaseView{
  void sendMessageSuccess();
  void sendMessageFail();
  void loginSuccess(UserAccount account);

}