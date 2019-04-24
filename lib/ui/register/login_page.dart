import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sd_play/common/clean_able_text_field.dart';
import 'package:flutter_sd_play/common/send_msg_btn.dart';
import 'package:flutter_sd_play/entity/user_account.dart';
import 'package:flutter_sd_play/http/http_util.dart';
import 'package:flutter_sd_play/mvp/presenter/login_presenter.dart';
import 'package:flutter_sd_play/mvp/view/login_view.dart';
import 'package:flutter_sd_play/ui/register/invite_code_page.dart';
import 'package:flutter_sd_play/utils/common_util.dart';
import 'package:flutter_sd_play/utils//constants.dart';
import 'package:flutter_sd_play/utils/share_preferences_util.dart';
import 'package:flutter_sd_play/utils/toast_util.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> implements LoginView{
  TapGestureRecognizer _ysTapGestureRecognizer;
  TapGestureRecognizer _fwTapGestureRecognizer;
  String _phoneNumber;
  String _msgCode;
  SendMsgBtn _msgBtn;
  bool _btnFlag=true; //按钮刷新
  LoginPresenter _presenter;

  Widget buildTextField(String hint, ITextFieldCallBack callBack) {
    return Theme(
      data: new ThemeData(primaryColor: Color(0xff292929)),
      child: new ITextField(
        cursorWidth: 1,
        cursorColor: Color(0xff292929),
        keyboardType: ITextInputType.number,
        hintText: hint == null ? "" : hint,
        hintStyle: TextStyle(color: Color(0xffd9d9d9), fontSize: 14),
        textStyle: TextStyle(color: Color(0xff292929), fontSize: 14),
        fieldCallBack: callBack,
      ),
    );
  }

  @override
  void dispose() {
    _ysTapGestureRecognizer.dispose();
    _fwTapGestureRecognizer.dispose();
    super.dispose();
    if(_presenter!=null){
      _presenter.dispose();
      _presenter=null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter=new LoginPresenter(this);
    _ysTapGestureRecognizer = TapGestureRecognizer()..onTap = _ysPress;
    _fwTapGestureRecognizer = TapGestureRecognizer()..onTap = _fwPress;
  }

  void _ysPress() {
    //隐私政策
    print("隐私政策点击");
  }

  void _fwPress() {
    //隐私政策
    print("服务协议点击");
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
      body: Column(
        children: <Widget>[
          Container(
            height: statusBarHeight,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/circle_logo.png',
                              width: 59,
                              height: 59,
                            ),
                            Container(
                              height: 14,
                            ),
                            Text(
                              '惠玩，才有赚',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  color: Color(0xff595959),
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(
                              height: 20,
                            ),
                            buildTextField("请输入手机号", (content) {
                              _phoneNumber = content;
                              print(_phoneNumber);
                              _btnFlag = !_msgBtn.isTiming;
                              setState(() {});
                            }),
                            Container(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: buildTextField("请输入验证码", (content) {
                                    _msgCode = content;
                                    _btnFlag = !_msgBtn.isTiming;
                                    setState(() {});
                                  }),
                                ),
                                Container(
                                  width: 20,
                                ),
                                checkBtn(),
                              ],
                            ),
                            _checkLogingBtn()
                          ],
                        ),
                      ),
                      top: 74,
                      left: 30,
                      right: 30,
                    ),
                    Positioned(
                      child: InkWell(child: Image.asset(
                        'images/close.png',
                        width: 18,
                        height: 18,
                      ),onTap: (){
                        Navigator.pop(context,"");
                      },),
                      left: 14,
                      top: 27,
                    ),
                    Positioned(
                      bottom: 23,
                      left: 30,
                      right: 30,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: "登录即代表您已阅读并同意",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xffadadad),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "《服务协议》",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xff242424),
                                    ),
                                    recognizer: _fwTapGestureRecognizer),
                                TextSpan(
                                  text: "和",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xffadadad),
                                  ),
                                ),
                                TextSpan(
                                    text: "《隐私政策》",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xff242424),
                                    ),
                                    recognizer: _ysTapGestureRecognizer),
                              ]),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future<Null> _login() async {
    _presenter.login(_phoneNumber, _msgCode, "sms");

  }

  Widget _checkLogingBtn() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      height: 49,
      child: InkWell(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "登录",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            )
          ],
        ),
        onTap: () {
          _login();
        },
      ),
      decoration: _buildLoginBtnDecoration(),
    );
  }

  Decoration _buildLoginBtnDecoration() {
    if (CommonUtil.isMobile(_phoneNumber) && !CommonUtil.isEmpty(_msgCode)) {
      return new BoxDecoration(
        color: Color(0xff292929),
        borderRadius: BorderRadius.circular(2),
      );
    } else {
      return new BoxDecoration(
        color: Color(0xffd9d9d9),
        borderRadius: BorderRadius.circular(2),
      );
    }
  }

  Widget checkBtn() {
    if (_msgBtn == null || _btnFlag) {
      _msgBtn = new SendMsgBtn(
          available: CommonUtil.isMobile(_phoneNumber),
          onTapCallback: () {
            _btnFlag = false;
            _sendCode(context);
          });
    }
    return _msgBtn;
  }

  Future<Null> _sendCode(BuildContext context) async {
    if (!CommonUtil.isMobile(_phoneNumber)) {
      Toast.show(context, "请输入正确的手机号码");
      return;
    }
    _presenter.sendMessage(_phoneNumber, "2");

  }

  @override
  void fail() {
    // TODO: implement fail
    Toast.show(context, "登录失败");
  }

  @override
  void loginSuccess(UserAccount account) {
    // TODO: implement loginSuccess
    if(!account.needBindParentUser){
      Navigator.pop(context, "sjsj");
    }else{
      //未绑定上级
      CommonUtil.start(context, new InviteCodePage());
    }
  }

  @override
  void sendMessageFail() {
    // TODO: implement sendMessageFail
    Toast.show(context, "短信发送失败");
  }

  @override
  void sendMessageSuccess() {
    // TODO: implement sendMessageSuccess
    Toast.show(context, "短信发送成功");
  }


}
