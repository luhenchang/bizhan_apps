import 'package:bizhan_study/activity/home_next_activity.dart';
import 'package:bizhan_study/myAppbar.dart' as prefix0;
import 'package:bizhan_study/utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'fragment/HomeFragment.dart';
import 'fragment/MapFragment.dart';
import 'generated/i18n.dart';
import 'main.dart';
import 'main_activity_bootom.dart';

class MainActivity extends StatefulWidget {
  MainActivity({String perc}) : super(key: ObjectKey(perc)) {
    perc = perc;
  }

  String perc;

  @override
  State<StatefulWidget> createState() {
    return _MainActivityState();
  }
}

class _MainActivityState extends State<MainActivity> {
  var fragmentPagerList = <Widget>[];
  var selectedIndex = 0;

  @override
  void initState() {
    fragmentPagerList.add(HomeFragment());
    fragmentPagerList.add(MapFragment());
    fragmentPagerList.add(Container(
      alignment: Alignment.center,
      color: Colors.red,
      height: 400,
      width: 300,
      child: Text("第3个界面"),
    ));

    fragmentPagerList.add(Container(
      alignment: Alignment.center,
      color: Colors.red,
      height: 400,
      width: 300,
      child: Text("第4个界面"),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 56,
            child: fragmentPagerList[selectedIndex],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child:Text(CommonUtils.getLocale(context).app_name),
        onPressed:(){
          Navigator.of(context).push(MaterialPageRoute(builder:(contexts){
            return NextPageActivity();
          }));
        },
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(top: 7),
        width: scrrenWidth,
        height: 66,
        color: Colors.white,
        child: MainActivityBootom(selected, selectedIndex),
      ),
    );
  }

  //作为接受者这里进行等待
  Function selected(var index) {
    selectedIndex = index;
    setState(() {});
  }
}
