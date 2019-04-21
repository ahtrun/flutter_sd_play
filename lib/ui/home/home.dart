import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sd_play/ui/home/page/mine_inviolable_rights.dart';
import 'package:flutter_sd_play/ui/home/page/sd_college.dart';
import 'package:flutter_sd_play/ui/register/head_image_page.dart';
import 'package:flutter_sd_play/ui/register/login_page.dart';
import 'package:flutter_sd_play/utils/common_util.dart';
import 'package:flutter_sd_play/utils/constants.dart';
import 'package:flutter_sd_play/utils/share_preferences_util.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // 当前界面的索引值
  List<BottomNavigationBarItem> _navigationViews; // 底部图标按钮区域
  List<StatefulWidget> _pageList; // 用来存放我们的图标对应的页面
  StatefulWidget _currentPage; // 当前的显示页面
  var tabImages;
  var appBarTitles = ['素店大学', '我的权益'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    tabImages = [
      [
        getTabImage('images/index1_normal.png'),
        getTabImage('images/index1_pressed.png')
      ],
      [
        getTabImage('images/index2_normal.png'),
        getTabImage('images/index2_pressed.png')
      ]
    ];

    // 初始化导航图标

    _navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
      new BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
    ];

    // 将我们 bottomBar 上面的按钮图标对应的页面存放起来，方便我们在点击的时候
    _pageList = <StatefulWidget>[
      new SDCollege(),
      new MineInviolableRights(),
    ];

    _currentPage = _pageList[_currentIndex];
    // 声明定义一个 底部导航的工具栏
    final bottomNavigationBar = new CupertinoTabBar(
      items: _navigationViews,
      // 添加 icon 按钮
      backgroundColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index) {


        SPUtil.getBool(Constants.ISLOGIN).then((bool){
          if(index==1&&!bool){
            CommonUtil.start(context, new LoginPage()).then((value){
              if(!CommonUtil.isEmpty(value)){
                // 点击之后，需要触发的逻辑事件
                setState(() {
                  _currentIndex = index;
                });
              }
            });
            return;
          }
          // 点击之后，需要触发的逻辑事件
          setState(() {
            _currentIndex = index;
          });

        });
      },
    );

    return new Scaffold(
      body: new Center(child: _currentPage // 动态的展示我们当前的页面
          ),
      bottomNavigationBar: bottomNavigationBar, // 底部工具栏
    );
  }

//  void _rebuild() {
//    setState(() {});
//  }
/*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Widget getTabTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 12.0, color: const Color(0xffF05B1A)));
    }
    return Text(appBarTitles[curIndex],
        style: new TextStyle(fontSize: 12.0, color: const Color(0xff5c6770)));
  }

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}

