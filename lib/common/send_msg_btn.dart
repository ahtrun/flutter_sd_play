import 'dart:async';

import 'package:flutter/material.dart';

class SendMsgBtn extends StatefulWidget {
  /// 倒计时的秒数，默认60秒。
  final int countdown;

  /// 用户点击时的回调函数。
  final Function onTapCallback;

  /// 是否可以获取验证码，默认为`false`。
  bool available;
  /// 是否进行倒计时
  bool isTiming=false;
  
  SendMsgBtn({
    this.countdown: 60,
    this.onTapCallback,
    this.available: false,
  });

  @override
  _SendMsgBtnState createState() => _SendMsgBtnState();
}

class _SendMsgBtnState extends State<SendMsgBtn> {
  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的秒数。
  int _seconds = -1;

  /// 当前墨水瓶（`InkWell`）的文本。
  String _verifyStr = '获取验证码';

  @override
  void initState() {
    super.initState();
//    _seconds = widget.countdown;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cancelTimer();
  }
  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if (_seconds == 0) {
        _cancelTimer();
        widget.available = true;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '已发送$_seconds' + 'S';
      setState(() {});
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
    widget.isTiming=false;
  }

  @override
  Widget build(BuildContext context) {
    return widget.available ? _buildAvailableBtn() : _buildUnableBtn();
  }

  Widget _buildAvailableBtn() {
    return InkWell(
      onTap: () {
        _cancelTimer();
        widget.isTiming=true;
        _seconds = widget.countdown;
        widget.available=false;
        _startTimer();
        _verifyStr = '已发送$_seconds' + 'S';
        setState(() {});
        widget.onTapCallback();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            new Radius.circular(2),
          ),
          border: Border.all(color: Color(0xff292929), width: 1),
        ),
        width: 100,
        height: 41,
        child: Center(
          child: Text(_seconds==-1?
            "获取验证码":"重新发送",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff292929)),
          ),
        ),
      ),
    );
  }

  Widget _buildUnableBtn() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          new Radius.circular(2),
        ),
        border: Border.all(color: Color(0xffd9d9d9), width: 1),
      ),
      width: 100,
      height: 41,
      child: Center(
        child: Text(
          _seconds == 0 ? "获取验证码" : "$_verifyStr",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffd9d9d9)),
        ),
      ),
    );
  }

//
//  Widget _build() {
//    return InkWell(
//      onTap: (){
//
//      },
//      child: Container(
//          child: Container(
//            decoration: BoxDecoration(color: Colors.transparent,
//              borderRadius: BorderRadius.all(new Radius.circular(2),),
//              border: Border.all(color: Color(0xff292929), width: 1),),
//            width: 100,
//            height: 41,
//            child: Center(
//              child: Text(
//                _seconds == 0 ? "发送验证码" : "$_verifyStr",
//                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
//              ),
//            ),
//          )
//      ),
//
//    );
//  }

}
