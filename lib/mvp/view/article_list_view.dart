import 'package:flutter_sd_play/entity/base_page.dart';
import 'package:flutter_sd_play/entity/college.dart';
import 'package:flutter_sd_play/mvp/base_view.dart';

abstract class ArticleListView extends BaseView{

  void queryArticleListSuccess(BasePage page);

}