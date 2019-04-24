import 'package:flutter/material.dart';
import 'package:flutter_sd_play/utils/common_util.dart';

class CommonTop extends StatefulWidget {
  int leftState=0;//0为左边默认的返回按钮，1=自定义的左边widget，2为没有左边widget
  String title;
  Widget rightView;
  Widget leftView;
  Color backgroundColor=Color(0xffffffff);

  CommonTop({this.leftState,this.title,this.rightView,this.leftView,this.backgroundColor});

  @override
  _CommonTopState createState() => _CommonTopState();
}

class _CommonTopState extends State<CommonTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      color: widget.backgroundColor,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildBack(context),
          Expanded(
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ),
          _buildRight()
        ],
      ),
    );
  }

  Widget _buildBack(BuildContext context){
    if(widget.leftState==1){
      return widget.leftView;
    }else if(widget.leftState==2){
      return Container();
    }else{
      return InkWell(
        child: Image.asset(
          'images/back2.png',
          width: 10,
          height: 18,
          fit: BoxFit.cover,
        ),
        onTap: () {
          CommonUtil.exit(context, widget);
        },
      );
    }
  }

  Widget _buildRight(){
    if(widget.rightView!=null){
      return widget.rightView;
    }else{
      return Container();
    }
  }

}
