import 'package:flutter/material.dart';
import 'package:flutter_sd_play/common/common_top.dart';
import 'package:flutter_sd_play/common/progreess_dialog.dart';
import 'package:flutter_sd_play/common/top_state_bar.dart';
import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/mvp/base_state.dart';
import 'package:flutter_sd_play/utils/common_util.dart';

class InviterListPage extends StatefulWidget {
  @override
  _InviterListPageState createState() => new _InviterListPageState();
}

class _InviterListPageState extends State<InviterListPage> {
  List<UserAccount> _userList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new TopStateBar(
        color: Color(0xfff7f7f7),
        child: new CommonTop(
          title: "其他推荐人",
          backgroundColor: Color(0xfff7f7f7),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_userList != null && _userList.length > 0) {
      return ListView.builder(
        itemBuilder: (context, i) {},
        itemCount: _userList.length,
      );
    } else {
      return getProgressDialog();
    }
  }
}






