import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sd_play/common/progreess_dialog.dart';
import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/mvp/presenter/mine_inviolable_rights_presenter.dart';
import 'package:flutter_sd_play/mvp/view/mine_inviolable_rights_view.dart';
import 'package:flutter_sd_play/utils/toast_util.dart';
import 'package:flutter_sd_play/r.dart';
class MineInviolableRights extends StatefulWidget {
  @override
  _MineInviolableRightsState createState() => _MineInviolableRightsState();
}

class _MineInviolableRightsState extends State<MineInviolableRights>
    implements MineInviolableRightsView {
  List<Map<String, String>> _menus = [
    {"image": "images/kefu.png", "name": "联系客服"},
    {"image": "images/account_auth.png", "name": "账户实名"},
    {"image": "images/fenxiang.png", "name": "分享订单"},
    {"image": "images/my_shop.png", "name": "我的专柜"},
    {"image": "images/share.png", "name": "邀请玩主"},
    {"image": "images/poster.png", "name": "专属海报"},
    {"image": "images/feedback.png", "name": "意见反馈"},
    {"image": "images/setting.png", "name": "设置"},
    {"image": "images/download.png", "name": "下载素店"},
    {"image": "images/bqk.png", "name": "版权库"}
  ];
  MineInviolableRightsPresenter _presenter;
  UserAccount _userAccount;

  @override
  void initState() {
    super.initState();
    _presenter = new MineInviolableRightsPresenter(this);
    _presenter.queryUserInfo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_presenter != null) {
      _presenter.dispose();
      _presenter = null;
    }
  }

  Widget _buildListView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int position) {
          return _buildMain();
        });
  }

  Widget _buildMain() {
    return Stack(
      children: <Widget>[
        Image.asset(R.images20xWzHeadBgPng),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 23),
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height: 24.0,
                          width: 24.0,
                          child: Image.asset(
                              'images/home_notice_white.png') // text to append (required)
                          ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    width: 27.0,
                    height: 27.0,
                    child: CircleAvatar(
                      radius: 13.5,
                      backgroundImage: AssetImage('images/sd_logo.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 15),
                  width: 71.0,
                  height: 71.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_userAccount.headUrl),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          _userAccount.nickName,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Image.asset(
                            _userAccount.sex == 0
                                ? 'images/sex_female.png'
                                : 'images/sex_male.png',
                            width: 11,
                            height: 17,
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Image.asset(
                              'images/wz_label_bg.png',
                              width: 38,
                              height: 17,
                            ),
                            Positioned(
                              left: 7,
                              right: 7,
                              bottom: 0.5,
                              child: Text(
                                '玩主',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        ///复制
                        Clipboard.setData(
                            new ClipboardData(text: _userAccount.randomCode));
                        Toast.show(context, "复制成功");
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 6.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '邀请码：${_userAccount.randomCode}',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            Container(
                              width: 32,
                              height: 14,
                              margin: EdgeInsets.only(left: 12),
                              child: Center(
                                child: Text(
                                  '复制',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: new Border.all(
                                      width: 0.5, color: Colors.white),
                                  color: Colors.transparent),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          _buildXFWZ(),
                          Image.asset(
                            'images/zx_grey.png',
                            width: 28,
                            height: 32,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${_userAccount.totalAmount.roundToDouble().toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 6,
                        ),
                        Text(
                          "累计收益(元)",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0x7ff0f0f0),
                    width: 1,
                    height: 17,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${_userAccount.cashAmount.roundToDouble().toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 6,
                        ),
                        Text(
                          "余额(元)",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0x7ff0f0f0),
                    width: 1,
                    height: 17,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${_userAccount.preAmount.roundToDouble().toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 6,
                        ),
                        Text(
                          "待到账(元)",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 13,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    padding: EdgeInsets.only(left: 25, right: 20),
                    decoration: new BoxDecoration(
//                      color: Colors.red
                      image: new DecorationImage(
                        image: AssetImage('images/mine_mask_bg.png',),
                          fit: BoxFit.fill // 填满
                      ),
                    ),
                    height: 104,
                    child: Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'images/my_zone.png',
                              width: 35,
                              height: 35,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "我的地盘",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${_userAccount.playCount}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "玩主",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${_userAccount.vipCount}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "玩客",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${_userAccount.nActiveVipCount}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "活跃用户",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 30,
                ),
                Text(
                  "我的服务",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff242424),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              child: GridView.count(
                  physics: new NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  mainAxisSpacing: 30.0,
                  // 竖向间距
                  crossAxisCount: 4,
                  // 横向 Item 的个数
                  crossAxisSpacing: 33.0,
                  // 横向间距
                  children: buildGridTileList()),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildXFWZ() {
    if (_userAccount.ifSuperVip) {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child: Image.asset(
          'images/xfwz_light.png',
          width: 33,
          height: 32,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _userAccount == null ? getProgressDialog() : _buildListView(),
    );
  }

  List<Widget> buildGridTileList() {
    List<Widget> list = [];
    for (int i = 0; i < _menus.length; i++) {
      if (i == 0) {
        list.add(_buildKF());
      } else if (i == _menus.length - 1) {
        list.add(_build_bqk());
      } else {
        list.add(_buildCommon(_menus[i]["image"], _menus[i]["name"]));
      }
    }
    return list;
  }

  Widget _buildKF() {
    return Center(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: 25.0,
                  width: 25.0,
                  child: Image.asset(
                      'images/kefu.png') // text to append (required)
                  ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 10,
          ),
          Text(
            "联系客服",
            style: TextStyle(
              color: Color(0xff242424),
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCommon(String image, String name) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            width: 25,
            height: 25,
          ),
          Container(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xff242424),
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _build_bqk() {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/bqk.png',
                width: 25,
                height: 25,
              ),
              Container(
                height: 10,
              ),
              Text(
                '版权库',
                style: TextStyle(
                  color: Color(0xff242424),
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'images/jqqd.png',
            width: 30,
            height: 10,
          ),
        )
      ],
    );
  }

//  Future<Null> _getData() async {
//    Map<String, dynamic> params = {"page": 1};
//    HttpUtil.instance.post(
//      Constants.GET_USER_INFO,
//      (data) {
//        _userAccount = UserAccount.fromJson(data);
//        setState(() {});
//      },
//      params: null,
//      errorCallBack: (errMsg) {
//        print(errMsg);
//      },
//    );
//  }

  @override
  void fail() {
    // TODO: implement fail
  }

  @override
  void queryUserInfoSuccess(UserAccount account) {
    // TODO: implement queryUserInfoSuccess
    _userAccount = account;
    setState(() {});
  }
}
