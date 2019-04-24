import 'package:flutter/material.dart';
import 'package:flutter_sd_play/common/common_top.dart';
import 'package:flutter_sd_play/common/top_state_bar.dart';
import 'package:flutter_sd_play/entity/sys_ver.dart';
import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/mvp/base_state.dart';
import 'package:flutter_sd_play/mvp/presenter/setting_presenter.dart';
import 'package:flutter_sd_play/mvp/view/setting_view.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends BaseState<SettingPage> implements SettingView{
  SettingPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new TopStateBar(
        color: Color(0xfff7f7f7),
        child: new CommonTop(title: "设置",backgroundColor: Color(0xfff7f7f7),),
      ),
      body: _buildBody(context),
    );
  }

  @override
  void resumed() {
    // TODO: implement resumed
    super.resumed();
    _presenter.getUserAccount();

  }

  @override
  void disposePresenter() {
    // TODO: implement disposePresenter
    if(_presenter!=null){
      _presenter.dispose();
      _presenter=null;
    }
  }

  @override
  void initData() {
    // TODO: implement initData
    _presenter.getUserAccount();
  }

  @override
  void initPresenter() {
    // TODO: implement initPresenter
    _presenter=new SettingPresenter(this);
  }

  @override
  void fail() {
    // TODO: implement fail
  }

  @override
  void getUserInfoSuccess(UserAccount account) {
    // TODO: implement getUserInfoSuccess
  }

  @override
  void logoutSuccess() {
    // TODO: implement logoutSuccess
  }

  @override
  void reqVersionSuccess(SysVer version) {
    // TODO: implement reqVersionSuccess
  }

 Widget _buildBody(BuildContext context) {
    return Container();
 }




}
