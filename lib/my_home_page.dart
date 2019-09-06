import 'package:bizhan_study/redux/gsy_state.dart';
import 'package:bizhan_study/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<GSYState>(builder: (context, store) {
      return Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    CommonUtils.changeLocale(store, 1);
                  },
                  child: Container(
                    alignment:Alignment.center,
                    height:100,
                    width:100,
                    child: Text(CommonUtils.getLocale(context).app_ok),
                  ),
                ),
                InkWell(
                  onTap: () {
                    CommonUtils.changeLocale(store, 2);
                  },
                  child: Container(
                    height:100,
                    width:100,
                    child: Text(CommonUtils.getLocale(context).app_cancel),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
