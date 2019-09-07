import 'package:flutter/material.dart';

class HomePageOne extends StatefulWidget {
  TabController _controller;
  String title;

  HomePageOne(this._controller, this.title);

  @override
  State<StatefulWidget> createState() {
    return _HomePageOneState();
  }
}

class _HomePageOneState extends State<HomePageOne> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return //第一行：TabBar
        Container(
            height: 53,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.color_lens),
                      Text(
                        "🧭",
                        style: TextStyle(fontSize: 19),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 53,
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.red,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: <Widget>[
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text(widget.title),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("推荐"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("追波"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("国家"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("故事2"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("追波"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("追波"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("故事2"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("追波"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("追波"),
                        ),
                        Container(
                          alignment:Alignment.center,
                          width: 60,
                          child: Text("追波"),
                        ),
                      ],
                      labelStyle: TextStyle(color: Colors.red),
                      labelColor: Colors.red,
                      labelPadding: EdgeInsets.all(0.0),
                      indicatorPadding: EdgeInsets.all(0.0),
                      indicatorWeight: 2.3,
                      unselectedLabelColor: Colors.black,
                      controller: widget._controller,
                    ),
                  ),
                ),
              ],
            ));
  }
}
