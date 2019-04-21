// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article()
    ..collegeId = json['collegeId'] as int
    ..collegeName = json['collegeName'] as String
    ..createTimeStr = json['createTimeStr'] as String
    ..id = json['id'] as int
    ..imgUrl = json['imgUrl'] as String
    ..isDelete = json['isDelete'] as int
    ..name = json['name'] as String
    ..page = json['page'] as int
    ..pageSize = json['pageSize'] as int
    ..seqNum = json['seqNum'] as int;
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'collegeId': instance.collegeId,
      'collegeName': instance.collegeName,
      'createTimeStr': instance.createTimeStr,
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'isDelete': instance.isDelete,
      'name': instance.name,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'seqNum': instance.seqNum
    };
