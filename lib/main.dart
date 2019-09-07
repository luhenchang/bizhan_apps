import 'package:bizhan_study/fragment/HomeFragment.dart';
import 'package:bizhan_study/provide/home_provide.dart';
import 'package:bizhan_study/redux/gsy_state.dart';
import 'package:bizhan_study/utils/common_utils.dart';
import 'package:bizhan_study/utils/language/style/gsy_style.dart';
import 'package:bizhan_study/utils/localization/gsy_localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provide/provide.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'main_activity.dart';
import 'package:redux/redux.dart';
import 'generated/i18n.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'my_home_page.dart';

void main() {
  runApp(
    new MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateWidget();
  }
}

class _StateWidget extends State<MyApp> with TickerProviderStateMixin{
  Locale _locale = const Locale('zh', 'CH');
  final store = new Store<GSYState>(
    appReducer,

    ///初始化数据
    initialState: new GSYState(
        themeData: CommonUtils.getThemeData(Color.fromRGBO(255, 255, 255, 1)),
        locale: Locale('zh', 'CH')),
  );


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModel<HomeBeanProvide>(
      model: new HomeBeanProvide(),
      child: new StoreProvider(
        store: store,
        child: new StoreBuilder<GSYState>(
          builder: (context, store) {
            return MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GSYLocalizationsDelegate.delegate,
              ],
              locale: store.state.locale,
              supportedLocales: [store.state.locale],
              theme: store.state.themeData,
              home:new StoreBuilder<GSYState>(builder: (context, store) {
                ///通过 StoreBuilder 和 Localizations 实现实时多语言切换
                return new Localizations.override(
                  context: context,
                  locale: store.state.locale,
                  child:MainActivity(),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
