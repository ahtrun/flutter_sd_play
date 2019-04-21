import 'package:flutter_sd_play/mvp/base_presenter.dart';
import 'package:flutter_sd_play/mvp/model/mine_inviolable_rights_model.dart';
import 'package:flutter_sd_play/mvp/view/mine_inviolable_rights_view.dart';
 class MineInviolableRightsPresenter extends BasePresenter{
   MineInviolableRightsModel _model;
   MineInviolableRightsView _view;


   MineInviolableRightsPresenter(this._view){
    _model=new MineInviolableRightsModel();
   }

   ///查询用户信息
   Future queryUserInfo() async {
     await _model.queryUserInfo(null,
             (bool, result) {
           if (_view == null) {
             return;
           }
           if (bool) {
             _view.queryUserInfoSuccess(result);
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