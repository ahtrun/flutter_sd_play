// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'college.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

College _$CollegeFromJson(Map<String, dynamic> json) {
  return College()
    ..createTime = json['createTime'] as int
    ..description = json['description'] as String
    ..id = json['id'] as int
    ..imgUrl = json['imgUrl'] as String
    ..isDelete = json['isDelete'] as int
    ..name = json['name'] as String
    ..page = json['page'] as int
    ..pageSize = json['pageSize'] as int
    ..seqNum = json['seqNum'] as int
    ..updateTime = json['updateTime'] as int;
}

Map<String, dynamic> _$CollegeToJson(College instance) => <String, dynamic>{
      'createTime': instance.createTime,
      'description': instance.description,
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'isDelete': instance.isDelete,
      'name': instance.name,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'seqNum': instance.seqNum,
      'updateTime': instance.updateTime
    };
