import 'package:flutter/material.dart';
import 'package:flutter_sd_play/common/clean_able_text_field.dart';
import 'package:flutter_sd_play/common/top.dart';
import 'package:flutter_sd_play/ui/register/head_image_page.dart';
import 'package:flutter_sd_play/utils/common_util.dart';

class InviteCodePage extends StatefulWidget {
  @override
  _InviteCodePageState createState() => _InviteCodePageState();
}

class _InviteCodePageState extends State<InviteCodePage> {
  String _randomCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new Top(
        color: Color(0xfff7f7f7),
        child: _buildTop(context),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 50, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildTextField(
              "请输入邀请码",
              (content) {
                _randomCode = content;
                print(_randomCode);
                setState(() {});
              },
            ),
            Container(
              height: 30,
            ),
            _checkBtn(),
            Container(
              height: 20,
            ),
            Container(
              height: 49,
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          "其他推荐人邀请码",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff232323),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
//          跳转其他推荐人
                },
              ),
              decoration: new BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xff232323),width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _checkBtn() {
    return Container(
      height: 49,
      child: InkWell(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "绑定",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
        onTap: () {
//          绑定操作
        CommonUtil.start(context, new HeadImagePage());
        },
      ),
      decoration: _buildLoginBtnDecoration(),
    );
  }

  Decoration _buildLoginBtnDecoration() {
    if (!CommonUtil.isEmpty(_randomCode)) {
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

  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      color: Color(0xfff7f7f7),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Image.asset(
              'images/back2.png',
              width: 10,
              height: 18,
              fit: BoxFit.cover,
            ),
            onTap: () {
              CommonUtil.exit(context, widget);
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                '请输入邀请码',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
