// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePage _$BasePageFromJson(Map<String, dynamic> json) {
  return BasePage()
    ..hasNextPage = json['hasNextPage'] as bool
    ..list = json['list'] as List
    ..isReceived = json['isReceived'] as bool
    ..image = json['image'] as String
    ..url = json['url'] as String
    ..isSearched = json['isSearched'] as bool
    ..productList = json['productList'] as List;
}

Map<String, dynamic> _$BasePageToJson(BasePage instance) => <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
      'isReceived': instance.isReceived,
      'image': instance.image,
      'url': instance.url,
      'isSearched': instance.isSearched,
      'productList': instance.productList
    };
