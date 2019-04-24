import 'package:flutter_sd_play/entity/sys_ver.dart';
import 'package:flutter_sd_play/http/http_util.dart';
import 'package:flutter_sd_play/utils/constants.dart';

class VersionModel{

  ///获取版本信息
  Future reqVersionInfo(Map<String, dynamic> params, Function(bool, Object) callBack) async {
    HttpUtil.instance.post(
        Constants.GET_VERSION,
            (data) {
          callBack(true,SysVer.fromJson(data));
        },
        params: params,
        errorCallBack: (errMsg) {
          print(errMsg);
          callBack(false,errMsg);
        });
  }
}