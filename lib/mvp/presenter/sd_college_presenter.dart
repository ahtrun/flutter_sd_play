import 'package:flutter_sd_play/mvp/base_presenter.dart';
import 'package:flutter_sd_play/mvp/model/sd_college_model.dart';
import 'package:flutter_sd_play/mvp/view/article_list_view.dart';
import 'package:flutter_sd_play/mvp/view/sd_college_view.dart';

class SDCollegePresenter extends BasePresenter {
  SDCollegeModel _collegeModel;
  SDCollegeView _collegeView;
  ArticleListView _articleListView;
  SDCollegePresenter(this._collegeView) {
    _collegeModel = new SDCollegeModel();
  }



  ///查询大学列表
  Future queryCollegeList() async {
    await _collegeModel.queryCollegeList({"page": 1},
            (bool, result) {
          if (_collegeView == null) {
            return;
          }
          if (bool) {
            _collegeView.queryCollegeListSuccess(result);
          } else {
            _collegeView.fail();
          }
        });
  }

  ///分页查询文章列表
  Future queryArticleList(int pageIndex) async {
    await _collegeModel.queryArticleList({"page": pageIndex},
        (bool, result) {
      if (_collegeView == null) {
        return;
      }
      if (bool) {
        _collegeView.queryArticleListSuccess(result);
      } else {
        _collegeView.fail();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _collegeView = null;
  }
}
