import 'package:json_annotation/json_annotation.dart';
part 'college.g.dart';
@JsonSerializable()
class College{
   int createTime;
   String description;
   int id;
   String imgUrl;
   int isDelete;
   String name;
   int page;
   int pageSize;
   int seqNum;
   int updateTime;

   College();
//不同的类使用不同的mixin即可
   factory College.fromJson(Map<String, dynamic> json) => _$CollegeFromJson(json);
   Map<String, dynamic> toJson() => _$CollegeToJson(this);

}