import 'package:json_annotation/json_annotation.dart';
part 'user_account.g.dart';
@JsonSerializable()
class UserAccount{

   String nickName;//昵称
//   String realName;	// 真实姓名
   String userName;//用户名
//   String cardNo;	// 身份证号
//   String hideCardNo;	// 隐藏身份证号
//   String credentialsUrl;	// 身份证地址
   String headUrl;//头像url
   bool ifBindMobile;//是否绑定手机
//   String mobile;//手机号
//   String companyName;
   String randomCode;
   bool needBindParentUser;//true-则需要跳到邀请码绑定页面 进行后面的步骤 false-跳过后面注册步骤直接登录成功
   bool ifHaveSetRead;//设置我的小红点 true是
//   bool ifWxBind;//是否绑定微信 true是
   int sex;//性别 0女1男
//   String signature;//个性签名
   bool ifAuth;//true已认证
   String address;//常住地
//   bool ifFlag;//是否默认
//   bool ifFirst;//是否是账号实名认证
//   String id;//实名认证id
   bool ifTags;//是否有标签 true是
   int ifBillVip;//会员等级 1玩客 2玩主 3金牌玩主 4 钻石玩主
//   int cardType;//1-身份证 2-护照 3-港澳通信证 4-港澳居民来往内地通信证 5-台湾居民来往内地通信证
//   String cardTypeName;
   String hideMobile;
   num resParam;
   num roleId;
   int userType;
   num availableGiftVoucherNum;
   bool ifRedCoupon;//优惠券是否显示小红点
   int activeVipCount;
   int activedAllIntegral;
   int activedIntegral;
   num cashAmount;
   int couponCount;
   bool ifRealVip;
   bool ifSuperVip;
   int nActiveVipCount;
   int playCount;
   num preAmount;
   num totalAmount;
   num userMonthTradeAmount;
   int vipCount;

   String getRandomCode(dynamic value){
      if(value is int){
         return "$value";
      }else{
         return value as String;
      }
   }

   UserAccount();
   factory UserAccount.fromJson(Map<String, dynamic> json) => _$UserAccountFromJson(json);
   Map<String, dynamic> toJson() => _$UserAccountToJson(this);

}