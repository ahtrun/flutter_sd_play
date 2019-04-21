// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return UserAccount()
    ..nickName = json['nickName'] as String
    ..userName = json['userName'] as String
    ..headUrl = json['headUrl'] as String
    ..ifBindMobile = json['ifBindMobile'] as bool
    ..randomCode = UserAccount().getRandomCode(json['randomCode'])
    ..needBindParentUser = json['needBindParentUser'] as bool
    ..ifHaveSetRead = json['ifHaveSetRead'] as bool
    ..sex = json['sex'] as int
    ..ifAuth = json['ifAuth'] as bool
    ..address = json['address'] as String
    ..ifTags = json['ifTags'] as bool
    ..ifBillVip = json['ifBillVip'] as int
    ..hideMobile = json['hideMobile'] as String
    ..resParam = json['resParam'] as num
    ..roleId = json['roleId'] as num
    ..userType = json['userType'] as int
    ..availableGiftVoucherNum = json['availableGiftVoucherNum'] as num
    ..ifRedCoupon = json['ifRedCoupon'] as bool
    ..activeVipCount = json['activeVipCount'] as int
    ..activedAllIntegral = json['activedAllIntegral'] as int
    ..activedIntegral = json['activedIntegral'] as int
    ..cashAmount = json['cashAmount'] as num
    ..couponCount = json['couponCount'] as int
    ..ifRealVip = json['ifRealVip'] as bool
    ..ifSuperVip = json['ifSuperVip'] as bool
    ..nActiveVipCount = json['nActiveVipCount'] as int
    ..playCount = json['playCount'] as int
    ..preAmount = json['preAmount'] as num
    ..totalAmount = json['totalAmount'] as num
    ..userMonthTradeAmount = json['userMonthTradeAmount'] as num
    ..vipCount = json['vipCount'] as int;
}



Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'userName': instance.userName,
      'headUrl': instance.headUrl,
      'ifBindMobile': instance.ifBindMobile,
      'randomCode': instance.randomCode,
      'needBindParentUser': instance.needBindParentUser,
      'ifHaveSetRead': instance.ifHaveSetRead,
      'sex': instance.sex,
      'ifAuth': instance.ifAuth,
      'address': instance.address,
      'ifTags': instance.ifTags,
      'ifBillVip': instance.ifBillVip,
      'hideMobile': instance.hideMobile,
      'resParam': instance.resParam,
      'roleId': instance.roleId,
      'userType': instance.userType,
      'availableGiftVoucherNum': instance.availableGiftVoucherNum,
      'ifRedCoupon': instance.ifRedCoupon,
      'activeVipCount': instance.activeVipCount,
      'activedAllIntegral': instance.activedAllIntegral,
      'activedIntegral': instance.activedIntegral,
      'cashAmount': instance.cashAmount,
      'couponCount': instance.couponCount,
      'ifRealVip': instance.ifRealVip,
      'ifSuperVip': instance.ifSuperVip,
      'nActiveVipCount': instance.nActiveVipCount,
      'playCount': instance.playCount,
      'preAmount': instance.preAmount,
      'totalAmount': instance.totalAmount,
      'userMonthTradeAmount': instance.userMonthTradeAmount,
      'vipCount': instance.vipCount
    };
