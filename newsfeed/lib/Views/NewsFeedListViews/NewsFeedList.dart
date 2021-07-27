import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newsfeed/HttpRequests/NewsFeedHttpRequests.dart';
import 'package:newsfeed/Model/NewsFeed.dart';
import 'package:newsfeed/Views/NewsFeedListViews/NewDetails.dart';

import 'MainDrawerView.dart';
import 'NewsFeedItemview.dart';

class NewsFeedListView extends StatefulWidget {
  NewsFeedListState createState() => NewsFeedListState();
}

class NewsFeedListState extends State<NewsFeedListView> {
  List<Articles> newsList = [];
  List<String> newsSource = ["the-next-web", "associated-press"];
  late Future<List<Articles>> _future;

  @override
  void initState() {
    _future = getNewsList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Articles"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: false,
          child: FutureBuilder(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.black,
                ));
              } else {
                return Container(
                  color: Colors.grey.shade300,
                  child: ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final item = newsList[index];
                      return Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(10),
                        height: 350,
                        child: GestureDetector(
                          child: NewsFeedItem(item),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      (NewsDetails(item)),
                                ));
                          },
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<Articles>> getNewsList() async {
    for (var source in newsSource) {
      var newsFeed = await NewsFeedHttpRequests.getInstance.fetchNews(source);
      if (newsFeed != null && newsFeed.status == "ok")
        newsList.addAll(newsFeed.articles);
    }
    return newsList;
  }
}
