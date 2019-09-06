import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

import 'package:flutter/services.dart';
/*void main() {
  runApp(new Home());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}*/
void main(){
  runApp(new HomeFragment());
  if (Platform.isIOS) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isVisible = false;
  var scrollController = new ScrollController();
  double downY = 0.0;
  double lastDownY = 0.0;
  double lastListLength = 0.0;
  var editerTextControner = TextEditingController();

  var mTextFiledController = TextEditingController();

  var _scrollOffsetContenner = new ScrollController(initialScrollOffset: 100.0);

  double dowOneY = 0.0;
  bool appbarIsvisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 250, 150, 150)),
      home: Scaffold(
        appBar: appbarIsvisible
            ? AppBar(
                elevation: 0.0,
                title: Row(
                  children: <Widget>[
                    //Image.asset("images/longnv5.jpeg"),
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
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                        )
                      ],
                    ),
                    Container(
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
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
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              )
            : null,
        //TODO 列表部件1：
        body: new Listener(
          onPointerDown: (dowPointEvent) {
            dowOneY = dowPointEvent.position.dy;
            print("Dowsize=${dowPointEvent.size}");
            print("Dowposition=${dowPointEvent.position.distance}");
            print("Dowposiontx=${dowPointEvent.position.dx}");
            print("Dowposionty=${dowPointEvent.position.dy}");
            print(
                "${sqrt(dowPointEvent.position.dx * dowPointEvent.position.dx + dowPointEvent.position.dy * dowPointEvent.position.dy)}");
          },
          onPointerMove: (movePointEvent) {
            print("MOve=${movePointEvent.position.dx}");
            print("MoveY=${movePointEvent.position.dy}");
            if (movePointEvent.position.dy - dowOneY < 0) {
              if (-(movePointEvent.position.dy - dowOneY) > 40) {
                setState(() {
                  appbarIsvisible = false;
                });
              }
              print("向上滑动");
            } else {
              if ((movePointEvent.position.dy - dowOneY) > 40) {
                setState(() {
                  appbarIsvisible = true;
                });
              }
              print("向下滑动");
            }
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            reverse: false,
            controller: _scrollOffsetContenner,
            children: <Widget>[
              Container(
                alignment: Alignment(0, 0),
                color: Colors.yellowAccent,
                height: 100.0,
                width: 200.0,
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.white12),
                ),
              ),
              Container(
                color: Colors.red,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.black,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.white12,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.green,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.blue,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.red,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.black,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.white12,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.green,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.blue,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.red,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.black,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.white12,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.green,
                height: 100.0,
                width: 200.0,
              ),
              Container(
                color: Colors.blue,
                height: 100.0,
                width: 200.0,
              ),
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (coun, index) {
                      return Container(
                        color: Colors.yellowAccent,
                        width: 130.0,
                        height: 70.0,
                        child: Icon(Icons.print),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
