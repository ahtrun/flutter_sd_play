import 'package:json_annotation/json_annotation.dart';
part 'sys_ver.g.dart';
@JsonSerializable()
class SysVer{
   int id;
  // 备注
   String remark;
  // 更新地址
   String downloadUrl;
   int updateFlag;//0不更新 1 更新 2强制更新
  // 版本名称
   String verValue;
   String wxUserDownUrl;
   String wxMaterialDownUrl;
   bool ifCash;//是否使用缓存
   int wxVerNo;


   SysVer();

   factory SysVer.fromJson(Map<String, dynamic> json) => _$SysVerFromJson(json);
   Map<String, dynamic> toJson() => _$SysVerToJson(this);

}