import 'package:flutter/material.dart';
import 'package:flutter_sd_play/common/progreess_dialog.dart';
import 'package:flutter_sd_play/common/top.dart';
import 'package:flutter_sd_play/entity/article.dart';
import 'package:flutter_sd_play/entity/base_page.dart';
import 'package:flutter_sd_play/entity/college.dart';
import 'package:flutter_sd_play/mvp/presenter/sd_college_presenter.dart';
import 'package:flutter_sd_play/mvp/view/sd_college_view.dart';
import 'package:flutter_sd_play/ui/home/view/article_item.dart';
import 'package:flutter_sd_play/ui/home/view/college_item.dart';

class SDCollege extends StatefulWidget {
  @override
  _SDCollegeState createState() => _SDCollegeState();
}

class _SDCollegeState extends State<SDCollege> implements SDCollegeView{
  List<String> _typeList = [];
  ScrollController _scrollController = ScrollController(); //listview的控制器
  List<College> _collegeList = [];
  List<Article> _articleList = [];
  bool _isLoading;
  BasePage _basePage;
  SDCollegePresenter _presenter;
  int _pageIndex = 1;
  @override
  void initState() {
    super.initState();
    _presenter=new SDCollegePresenter(this);
    _getData();
    _scrollController.addListener(() {
      if (!_isLoading &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _basePage != null &&
          _basePage.hasNextPage) {
        print('滑动到了最底部');
        _isLoading = true;
        _presenter.queryArticleList(_pageIndex);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    if(_presenter!=null){
      _presenter.dispose();
      _presenter=null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new Top(
        child: _buildTop(context),
      ),
      body: _buildBody(context),
    );
  }


  Widget _buildBody(BuildContext context){
    if(_typeList.length==0){
      return getProgressDialog();
    }else{
      return RefreshIndicator(
        onRefresh: _getData,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _typeList.length,
          itemBuilder: (context, index) => _buildItem(context, _typeList[index]),
        ),
      );
    }
  }

  Future<Null> _getData() async {
    _typeList.clear();
    _collegeList.clear();
    _articleList.clear();
    _pageIndex = 1;
    _presenter.queryCollegeList();

//    Map<String, dynamic> params = {"page": 1};
//    HttpUtil.instance.post(
//      Constants.GET_CORE_COLLEGE_LIST,
//      (data) {
//        BasePage basePage = BasePage.fromJson(data);
//        for (var i = 0; i < basePage.list.length; i++) {
//          collegeList.add(College.fromJson(basePage.list[i]));
//        }
//        _loadList();
//      },
//      params: params,
//      errorCallBack: (errMsg) {
//        print(errMsg);
//      },
//    );
  }


//
//  void _loadList() {
//    Map<String, dynamic> params = {"page": "$pageIndex"};
//    HttpUtil.instance.post(
//        Constants.GET_CORE_COLLEGE_DETIAL_LIST,
//        (data) {
//          _basePage = BasePage.fromJson(data);
//          for (var i = 0; i < _basePage.list.length; i++) {
//            _articleList.add(Article.fromJson(_basePage.list[i]));
//          }
//          setState(() {
//            if (pageIndex == 1) {
//              _initView();
//            } else {
//              _loadArticleView();
//            }
//            pageIndex++;
//            _isLoading = false;
//          });
//        },
//        params: params,
//        errorCallBack: (errMsg) {
//          print(errMsg);
//        });
//  }

  void _initView() {
    if (_collegeList != null && _collegeList.length > 0) {
      _typeList.add("college");
    }
    if (_articleList != null && _articleList.length > 0) {
      _loadArticleView();
    }
  }

  void _loadArticleView() {
    for (var i = (_pageIndex - 1) * 10; i < _articleList.length; i++) {
      _typeList.add("article_$i");
      _typeList.add("articleDivider");
    }
  }

  Widget _buildItem(BuildContext ctx, String type) {
    Widget widget;
    switch (type) {
      case "college":
        widget = new CollegeItem(
          collegeList: _collegeList,
        );
        break;
      case "articleDivider":
        widget = Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Divider(
            color: Color(0xffF0F0F0),
            height: 1.0,
          ),
        );
        break;
    }
    if (type.contains("article_")) {
      List<String> arr = type.split("_");
      widget = new ArticleItem(
        article: _articleList[int.parse(arr[1])],
      );
    }

    return widget;
  }

  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      color: Color(0xffffffff),
      height: 50,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: 24.0,
                  width: 24.0,
                  child: Image.asset(
                      'images/home_notice_black.png') // text to append (required)
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
          Expanded(
            child: Center(
              child: Text(
                '惠玩',
                style: TextStyle(fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ),
          Container(
            width: 27.0,
            height: 27.0,
            child: CircleAvatar(
              radius: 13.5,
              backgroundImage: AssetImage('images/sd_logo.png'),
            ),
          )
        ],
      ),
    );
  }

  @override
  void fail() {
    // TODO: implement fail
    if(_collegeList!=null&&_collegeList.length>0){
      setState(() {

      });
    }
  }

  @override
  void queryArticleListSuccess(BasePage page) {
    // TODO: implement queryArticleListSuccess
    this._basePage=page;
    for (var i = 0; i < _basePage.list.length; i++) {
      _articleList.add(Article.fromJson(_basePage.list[i]));
    }
    setState(() {
      if (_pageIndex == 1) {
        _initView();
      } else {
        _loadArticleView();
      }
      _pageIndex++;
      _isLoading = false;
    });

  }

  @override
  void queryCollegeListSuccess(List<College> collegeList) {
    // TODO: implement queryCollegeListSuccess
    this._collegeList=collegeList;
    _presenter.queryArticleList(_pageIndex);

  }
}
