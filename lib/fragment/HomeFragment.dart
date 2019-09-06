import 'package:bizhan_study/activity/home_next_activity.dart';
import 'package:bizhan_study/bean/home_bean_entity.dart';
import 'package:bizhan_study/bean/home_page_bean_entity.dart';
import 'package:bizhan_study/generated/i18n.dart';
import 'package:bizhan_study/provide/home_provide.dart';
import 'package:bizhan_study/redux/gsy_state.dart';
import 'package:bizhan_study/redux/locale_redux.dart';
import 'package:bizhan_study/utils/HttpUtlils.dart';
import 'package:bizhan_study/utils/common_utils.dart';
import 'package:bizhan_study/view/home/BootomView.dart';
import 'package:bizhan_study/view/home/HomeFragmentAppBar.dart';
import 'package:bizhan_study/view/home/HomePageOne.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:convert' show json;

import 'package:provide/provide.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:redux/redux.dart';

import '../my_home_page.dart';

void main() => runApp(new HomeFragment());

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}

class _HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin {
  List<HomePageBeanResobj> mDataHome = new List();
  bool isVisible = false;
  var isTure = true;
  String title;
  var _controller;

  String name = "英雄联盟";
  var colorsTv = Colors.black;

  _ChangeValue(val) {
    setState(() {
      isTure = val;
    });
  }

  HomeBeanProvide homeBeanProvide;

  @override
  void initState() {
    homeBeanProvide = ScopedModel.of<HomeBeanProvide>(context);
    title = "首页";
    homeBeanProvide.getDataServer("http://116.62.149.237:8080/USR000100003",
        () {
      mDataHome.addAll(homeBeanProvide.mData);
      setState(() {});
    });
    super.initState();
    _controller = new TabController(length: 11, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 235, 122, 153)),
      home: Scaffold(
        appBar: HomeFragmentAppBar((value) {
          colorsTv = value;
          setState(() {});
        }),
        body: Column(
          children: <Widget>[
            //第一行：TabBar
            HomePageOne(_controller, title),
            BootomView(),
            Expanded(
              child:
                  //第二行：TabBarView
                  TabBarView(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          child: Image.asset(
                            "images/lonnv10.jpg",
                            fit: BoxFit.cover,
                            height: 120.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemExtent: MediaQuery.of(context).size.width / 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(
                                          Icons.settings_applications,
                                          size: 40.0,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Text(name),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Icon(
                                          Icons.settings_applications,
                                          size: 40.0,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Text(name),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 5,
                        ),
                      ),
                      Container(
                        height: 1.0,
                        color: Colors.black12,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return MyHomePage();
                                }));
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Text(
                                  CommonUtils.getLocale(context).app_cancel,
                                  style: TextStyle(color: colorsTv),
                                ),
                              ),
                            ),
                            Text(
                              "16小时之前",
                              style: TextStyle(color: Colors.black26),
                            ),
                            InkWell(
                              onTap: () {
                                homeBeanProvide.setLiveTitleName(0, "😄");
                                //不需要
                              },
                              child: Text("我的关注"),
                            ),
                            Text(
                              "直播了见电台",
                              style: TextStyle(color: Colors.black26),
                            ),
                            Icon(
                              Icons.home,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1.0,
                        color: Colors.black12,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("推荐直播"),
                            Row(
                              children: <Widget>[
                                Text("缓一缓"),
                                Icon(
                                  Icons.directions_run,
                                  color: Colors.black26,
                                  size: 20.0,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: mDataHome.length == 0
                            ? Container()
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      homeBeanProvide.deletIndex(index);
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.0, right: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.0)),
                                                  child: Image.network(
                                                    mDataHome[index].liveImg,
                                                    height: 120,
                                                    width: 200,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        mDataHome[index]
                                                            .livePersonName,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.perm_identity,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                          Text(
                                                            "8.5万人",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Text("三局杀撸游戏ß"),
                                          Text(
                                            "其他游戏",
                                            style: TextStyle(
                                                color: Colors.black26),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: mDataHome.length,
                              ),
                      ),
                    ],
                  ),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  HomePageEnd(),
                ],
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageEnd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageEndBootomViewState();
  }
}

///切换主题
changeLocale(Store<GSYState> store, int index) {
  Locale locale = store.state.platformLocale;
  switch (index) {
    case 1:
      locale = Locale('zh', 'CH');
      break;
    case 2:
      locale = Locale('en', 'US');
      break;
  }
  store.dispatch(RefreshLocaleAction(locale));
}

class _HomePageEndBootomViewState extends State<HomePageEnd> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text("不行么？说话"),
          color: Colors.blue,
          width: 300,
          height: 1300,
        ),
      ],
    );
  }
}
