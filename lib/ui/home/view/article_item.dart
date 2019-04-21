import 'package:flutter/material.dart';
import 'package:flutter_sd_play/entity/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  ArticleItem({@required this.article}) : assert(article != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: InkWell(
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                width: 112,
                height: 78,
                placeholder: "images/image_def.png",
                image: article.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff333333),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: <Widget>[
                          Text(
                            article.createTimeStr,
                            style:
                            TextStyle(fontSize: 13, color: Color(0xff999999)),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              article.collegeName,
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff999999)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ) ,
            )
          ],
        ),
      ),
    );
  }
}
