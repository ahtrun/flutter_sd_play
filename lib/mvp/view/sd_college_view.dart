import 'package:flutter_sd_play/entity/base_page.dart';
import 'package:flutter_sd_play/entity/college.dart';
import 'package:flutter_sd_play/mvp/base_view.dart';

abstract class SDCollegeView extends BaseView{

  void queryCollegeListSuccess(List<College> collegeList);

  void queryArticleListSuccess(BasePage page);


}