import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sd_play/common/clean_able_text_field.dart';
import 'package:flutter_sd_play/common/top.dart';
import 'package:flutter_sd_play/utils/common_util.dart';
import 'package:image_picker/image_picker.dart';

class HeadImagePage extends StatefulWidget {
  @override
  _HeadImagePageState createState() => _HeadImagePageState();
}

class _HeadImagePageState extends State<HeadImagePage> {
  String _imageUrl;
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new Top(
        child: _buildTop(context),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "完善您的头像与昵称",
                    style: TextStyle(
                        color: Color(0xff292929),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  _buildImage(),
                  Container(
                    height: 13,
                  ),
                  Text(
                    "点击上传头像",
                    style: TextStyle(
                        color: Color(0xffadadad),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("昵称", style: TextStyle(color: Color(0xff292929),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),),
                      Container(width: 10,),
                      Container(child: buildTextField("请输入验证码", (content) {

                      }), width: 180, height: 42,
                      ),
                    ],
                  ),

                ],
              ),),
            Positioned(
              child: _checkBtn(),
              left: 43,
              right: 43,
              bottom: 49,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hint, ITextFieldCallBack callBack) {
    return Theme(
      data: new ThemeData(primaryColor: Color(0xff292929)),
      child: new ITextField(
        cursorWidth: 1,
        cursorColor: Color(0xff292929),
        keyboardType: ITextInputType.number,
        hintText: hint == null ? "" : hint,
        hintStyle: TextStyle(color: Color(0xffadadad), fontSize: 15),
        textStyle: TextStyle(color: Color(0xff292929), fontSize: 15),
        fieldCallBack: callBack,
      ),
    );
  }

  Widget _buildImage() {
    return InkWell(child: Container(margin: EdgeInsets.only(top: 50),
      child: CommonUtil.isEmpty(_imageUrl)
          ? Image.asset('images/image_def.png')
          : CircleAvatar(backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(_imageUrl),),
      width: 80,
      height: 80,), onTap: _showPhotoDialog,);
  }

  void _showPhotoDialog() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListView(children: <Widget>[

                InkWell(child: Container(
                  color: Colors.white,
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text('拍照', style: TextStyle(
                        color: Color(0xff292929)
                    ),),
                  ),

                ),
                  onTap: () async {
                    imageFile =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                    Navigator.pop(context);
                  },),
                Container(color: Color(0xfff7f7f7), height: 1,),
                InkWell(child: Container(
                  color: Colors.white,
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text('从手机相册选择', style: TextStyle(
                        color: Color(0xff292929)
                    ),),
                  ),

                ),
                  onTap: () async {
                    imageFile =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                    Navigator.pop(context);
                  },),
                Container(color: Color(0xfff7f7f7), height: 10,),
                InkWell(child: Container(
                  color: Colors.white,
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text('取消', style: TextStyle(
                        color: Color(0xff292929)
                    ),),
                  ),

                ),
                  onTap: () {
                    Navigator.of(context).pop(); //隐藏弹出框
                  },),
              ],
                shrinkWrap: true,

//                title: Center()new Text("Camera"),
//                onTap: () async {
//                  imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
//                  Navigator.pop(context);
//                },
              ),
//              new ListTile(
//                leading: new Icon(Icons.photo_library),
//                title: new Text("Gallery"),
//                onTap: () async {
//                  imageFile =
//                  await ImagePicker.pickImage(source: ImageSource.gallery);
//                  Navigator.pop(context);
//                },
//              ),
            ],
          );
        }
    );
  }

  void _show() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
//                leading: new Icon(Icons.photo_camera),
                title: new Text("Camera"),
                onTap: () async {
                  imageFile =
                  await ImagePicker.pickImage(source: ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              new ListTile(
//                leading: new Icon(Icons.photo_library),
                title: new Text("Gallery"),
                onTap: () async {
                  imageFile =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      color: Color(0xffffffff),
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
            child: Container(),
          ),
          Container(
            width: 53,
            height: 22,
            child: Center(
              child: Text(
                "跳过",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            decoration: new BoxDecoration(
                color: Color(0x4c000000),
                borderRadius: BorderRadius.all(Radius.circular(2))),
          )
        ],
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
                  "下一步",
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
    if (!CommonUtil.isEmpty(_imageUrl)) {
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
}
