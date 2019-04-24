// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_ver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysVer _$SysVerFromJson(Map<String, dynamic> json) {
  return SysVer()
    ..id = json['id'] as int
    ..remark = json['remark'] as String
    ..downloadUrl = json['downloadUrl'] as String
    ..updateFlag = json['updateFlag'] as int
    ..verValue = json['verValue'] as String
    ..wxUserDownUrl = json['wxUserDownUrl'] as String
    ..wxMaterialDownUrl = json['wxMaterialDownUrl'] as String
    ..ifCash = json['ifCash'] as bool
    ..wxVerNo = json['wxVerNo'] as int;
}

Map<String, dynamic> _$SysVerToJson(SysVer instance) => <String, dynamic>{
      'id': instance.id,
      'remark': instance.remark,
      'downloadUrl': instance.downloadUrl,
      'updateFlag': instance.updateFlag,
      'verValue': instance.verValue,
      'wxUserDownUrl': instance.wxUserDownUrl,
      'wxMaterialDownUrl': instance.wxMaterialDownUrl,
      'ifCash': instance.ifCash,
      'wxVerNo': instance.wxVerNo
    };
