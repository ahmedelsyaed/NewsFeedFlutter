import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsfeed/Model/NewsFeed.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MainDrawerView.dart';

class NewsDetails extends StatelessWidget {
  Articles item;
  NewsDetails(this.item);

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    var author = item.author == null ? "Unknown" : item.author;
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Article Details"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Container(
        color: Colors.grey.shade300,
        padding: EdgeInsets.all(15),
        child: Stack(fit: StackFit.expand, children: [
          Container(
            margin: EdgeInsets.only(bottom: 60),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: item.urlToImage,
                  placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/placeolder.png"),
                              fit: BoxFit.cover))),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 15),
                MainContainer(
                  Text(item.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none)),
                ),
                SizedBox(height: 10),
                MainContainer(Text(
                  "By " + author,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.none),
                )),
                SizedBox(height: 20),
                MainContainer(Text(
                  item.description,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      decoration: TextDecoration.none),
                )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith<Size>(
                  (Set<MaterialState> states) {
                    return Size(width, 50); // Use the component's default.
                  },
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.black; // Use the component's default.
                  },
                ),
              ),
              onPressed: _launchURL,
              child: Container(
                child: Text(
                  "Visit Website",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }

  void _launchURL() async => await canLaunch(item.url)
      ? await launch(item.url)
      : throw 'Could not launch $item.url';
  Widget MainContainer(Widget childWidget) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: childWidget,
    );
  }
}
