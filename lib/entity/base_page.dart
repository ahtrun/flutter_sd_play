
import 'package:json_annotation/json_annotation.dart';
part 'base_page.g.dart';
@JsonSerializable()
class BasePage{
   bool hasNextPage;
   List list;
   bool isReceived;
   String image;
   String url;
   bool isSearched;
   List productList;

   BasePage();
//   BrandBean brand;
   factory BasePage.fromJson(Map<String, dynamic> json) => _$BasePageFromJson(json);
   Map<String, dynamic> toJson() => _$BasePageToJson(this);


}