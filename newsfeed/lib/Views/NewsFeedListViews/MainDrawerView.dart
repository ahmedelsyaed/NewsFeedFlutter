import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'NewsFeedList.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerState();
  }
}

class DrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Tony"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/profile.png"),
            ),
            accountEmail: Text("Tony@gmail.com"),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          ListTile(
            leading: Container(
                height: 30,
                child: Image(image: AssetImage("images/explore.png"))),
            title: Text("Articles"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (NewsFeedListView())),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Container(
                height: 30, child: Image(image: AssetImage("images/live.png"))),
            title: Text("Live Chat"),
          ),
          Divider(),
          ListTile(
            leading: Container(
                height: 30,
                child: Image(image: AssetImage("images/gallery.png"))),
            title: Text("Gallery"),
          ),
          Divider(),
          ListTile(
            leading: Container(
                height: 30,
                child: Image(image: AssetImage("images/wishlist.png"))),
            title: Text("Wish List"),
          ),
          Divider(),
          ListTile(
            leading: Container(
                height: 30,
                child: Image(image: AssetImage("images/onlineNews.png"))),
            title: Text("Emplore Online News"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
