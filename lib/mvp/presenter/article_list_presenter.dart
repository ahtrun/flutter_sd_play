import 'package:flutter_sd_play/mvp/base_presenter.dart';
import 'package:flutter_sd_play/mvp/model/sd_college_model.dart';
import 'package:flutter_sd_play/mvp/view/article_list_view.dart';

class ArticleListPresenter extends BasePresenter{
  SDCollegeModel _model;
  ArticleListView _view;


  ArticleListPresenter(this._view){
   _model=new SDCollegeModel();
  }

  ///分页查询文章列表
  Future queryArticleList(int pageIndex,int id) async {
    await _model.queryArticleList({"page": pageIndex,"id":id},
            (bool, result) {
          if (_view == null) {
            return;
          }
          if (bool) {
            _view.queryArticleListSuccess(result);
          } else {
            _view.fail();
          }
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _view=null;
  }

}