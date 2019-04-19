import 'package:flutter/material.dart';
import 'package:flutter_sd_play/entity/college.dart';
import 'package:flutter_sd_play/ui/article/article_list_page.dart';
import 'package:flutter_sd_play/utils/common_util.dart';

class CollegeItem extends StatelessWidget {
  final List<College> collegeList;

  CollegeItem({@required this.collegeList}) : assert(collegeList != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: new GridView.count(
        shrinkWrap: true,
        //增加
        padding: const EdgeInsets.only(
            left: 15.0, top: 20.0, right: 15.0, bottom: 20.0),
        primary: false,
        mainAxisSpacing: 12.0,
        // 竖向间距
        crossAxisCount: 3,
        // 横向 Item 的个数
        crossAxisSpacing: 12.0,
        // 横向间距
        children: buildGridTileList(context),
      ),
    );
  }

  List<Widget> buildGridTileList(BuildContext context) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < collegeList.length; i++) {
      widgetList.add(
        InkWell(onTap: (){
          College college=collegeList[i];
          CommonUtil.start(context, new ArticleListPage(college: college,));
        },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: "images/image_def.png",
              image: collegeList[i].imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    return widgetList;
  }
}
