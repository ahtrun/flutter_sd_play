import 'package:flutter_sd_play/entity/base_page.dart';
import 'package:flutter_sd_play/entity/college.dart';
import 'package:flutter_sd_play/http/http_util.dart';
import 'package:flutter_sd_play/utils/constants.dart';

class SDCollegeModel {



///查询大学列表
  Future queryCollegeList(Map<String, dynamic> params, Function(bool, Object) callBack) async {
    HttpUtil.instance.post(
      Constants.GET_CORE_COLLEGE_LIST,
          (data) {
        BasePage basePage = BasePage.fromJson(data);
        List<College> collegeList=[];
        for (var i = 0; i < basePage.list.length; i++) {
          collegeList.add(College.fromJson(basePage.list[i]));
        }
        callBack(true,collegeList);
      },
      params: params,
      errorCallBack: (errMsg) {
        callBack(false,errMsg);
      },
    );
  }


  ///查询文章列表
  Future queryArticleList(Map<String, dynamic> params, Function(bool, Object) callBack) async {
    HttpUtil.instance.post(
        Constants.GET_CORE_COLLEGE_DETIAL_LIST,
            (data) {
          BasePage basePage = BasePage.fromJson(data);
          callBack(true,basePage);
        },
        params: params,
        errorCallBack: (errMsg) {
          callBack(false,errMsg);
        });
  }

}
