import 'package:flutter/material.dart';
import 'package:flutter_sd_play/common/progreess_dialog.dart';
import 'package:flutter_sd_play/common/top.dart';
import 'package:flutter_sd_play/entity/article.dart';
import 'package:flutter_sd_play/entity/base_page.dart';
import 'package:flutter_sd_play/entity/college.dart';
import 'package:flutter_sd_play/mvp/base_state.dart';
import 'package:flutter_sd_play/mvp/presenter/article_list_presenter.dart';
import 'package:flutter_sd_play/mvp/view/article_list_view.dart';
import 'package:flutter_sd_play/ui/home/view/article_item.dart';
import 'package:flutter_sd_play/utils/common_util.dart';

class ArticleListPage extends StatefulWidget {
  final College college;

  ArticleListPage({Key key, @required this.college}) : super();

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends BaseState<ArticleListPage>
    implements ArticleListView {
  bool _isLoading;
  ScrollController _scrollController = ScrollController(); //listview的控制器
  BasePage _basePage;
  List<Article> _articleList = [];
  int _pageIndex = 1;
  ArticleListPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new Top(
        color: Color(0xfff7f7f7),
        child: _buildTop(context),
      ),
      body: _buildBody(context),
    );
  }

  Future<Null> _getData() async {
    _pageIndex = 1;
    _articleList.clear();
    _loadList();
  }

  Future<Null> _loadList() async {
    _presenter.queryArticleList(_pageIndex, widget.college.id);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!_isLoading &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _basePage != null &&
          _basePage.hasNextPage) {
        print('滑动到了最底部');
        _isLoading = true;
        _loadList();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();

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
            child: Center(
              child: Text(
                '超级店长',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ),
          InkWell(
            child: Image.asset(
              'images/share2.png',
              width: 19,
              height: 19,
            ),
            onTap: () {
              CommonUtil.exit(context, widget);
            },
          )
        ],
      ),
    );
  }

//  Widget _buildBody(BuildContext context) {
//    if (_articleList.length == 0) {
//      return getProgressDialog();
//    } else {
//      return RefreshIndicator(
//        onRefresh: _getData,
//        child: ListView.builder(
//          controller: _scrollController,
//          itemCount: _articleList.length,
//          itemBuilder: (context, index) => _buildItem(_articleList[index]),
//        ),
//      );
//    }
//  }

  Widget _buildBody(BuildContext context) {

      return Stack(children: <Widget>[
        RefreshIndicator(
          onRefresh: _getData,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _articleList.length,
            itemBuilder: (context, index) => _buildItem(_articleList[index]),
          ),
        ),_articleList.length==0?getProgressDialog():Container(),

      ],);

  }

  Widget _buildItem(Article article) {
    return new ArticleItem(
      article: article,
    );
  }

  @override
  void fail() {
    // TODO: implement fail
  }

  @override
  void queryArticleListSuccess(BasePage page) {
    // TODO: implement queryArticleListSuccess
    _basePage = page;
    for (var i = 0; i < _basePage.list.length; i++) {
      _articleList.add(Article.fromJson(_basePage.list[i]));
    }
    setState(() {
      _pageIndex++;
      _isLoading = false;
    });
  }

  @override
  void disposePresenter() {
    // TODO: implement disposePresenter
    if (_presenter != null) {
      _presenter.dispose();
      _presenter = null;
    }
  }

  @override
  void initData() {
    // TODO: implement initData
    _getData();

  }

  @override
  void initPresenter() {
    // TODO: implement initPresenter
    _presenter = new ArticleListPresenter(this);

  }
}
