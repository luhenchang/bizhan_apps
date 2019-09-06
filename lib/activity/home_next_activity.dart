import 'package:bizhan_study/generated/i18n.dart';
import 'package:bizhan_study/provide/home_provide.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';

class NextPageActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NextPageActivityState();
  }
}

class _NextPageActivityState extends State<NextPageActivity> {
  @override
  void initState() {
    homeBeanProvide = ScopedModel.of<HomeBeanProvide>(context);
    setState(() {});
    super.initState();
  }

  HomeBeanProvide homeBeanProvide;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          //localeChange(Locale('zh', '')); //zh为中文
        },
        child: Center(
          child: Text("切换中文"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("切换英文"),
        onPressed: () {
         // localeChange(Locale('en', '')); //zh为中文
          setState(() {});
        },
      ),
    );
  }
}
