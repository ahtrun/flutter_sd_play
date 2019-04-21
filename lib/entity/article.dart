import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';
@JsonSerializable()
class Article{

   int collegeId;
   String collegeName;
   String createTimeStr;
   int id;
   String imgUrl;
   int isDelete;
   String name;
   int page;
   int pageSize;
   int seqNum;


   Article(); //不同的类使用不同的mixin即可
   factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
   Map<String, dynamic> toJson() => _$ArticleToJson(this);

}