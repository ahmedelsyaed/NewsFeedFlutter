import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:newsfeed/Model/NewsFeed.dart';

class NewsFeedItem extends StatelessWidget {
  Articles item;
  NewsFeedItem(this.item);

  @override
  Widget build(BuildContext context) {
    var author = item.author == null ? "Unknown" : item.author;
    var ArticleDate = DateTime.parse(item.publishedAt);
    var formatedDate = new DateFormat("MMM dd, yyyy").format(ArticleDate);

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: item.urlToImage,
          placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/placeholder.png"),
                      fit: BoxFit.cover))),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(height: 15),
        MainContainer(
          Text(item.title,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18)),
        ),
        SizedBox(height: 10),
        Expanded(
            child: MainContainer(Text(
          "By " + author,
          style: TextStyle(color: Colors.grey),
        ))),
        Expanded(
          child: Row(
            children: [
              MainContainer(Text(
                formatedDate,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.end,
              )),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget MainContainer(Widget childWidget) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: childWidget,
    );
  }
}
