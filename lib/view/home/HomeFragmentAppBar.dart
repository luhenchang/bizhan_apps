import 'package:flutter/material.dart';

class HomeFragmentAppBar extends StatefulWidget implements PreferredSizeWidget {
  ValueChanged<dynamic>valueChanged;
  HomeFragmentAppBar(this.valueChanged);
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentAppBarState();
  }

  @override
  Size get preferredSize => Size(100, 50);
}

class _HomeFragmentAppBarState extends State<HomeFragmentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Row(
        children: <Widget>[
          Stack(
            alignment: Alignment(1.5, -1.4),
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "images/longnv5.jpeg",
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              Container(
                width: 9.1,
                height: 9.1,
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1)),
              )
            ],
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 17.0, right: 13.0),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 4.0),
              width: 180.0,
              height: 30.0,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
          ),
          Image.asset(
            "images/music_icon_subject.png",
            width: 38.0,
            height: 41.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.settings_applications,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child:InkWell(
              onTap: () {
                widget.valueChanged(Colors.red);
              },
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
