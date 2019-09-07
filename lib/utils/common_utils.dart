import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bizhan_study/redux/gsy_state.dart';
import 'package:bizhan_study/redux/locale_redux.dart';
import 'package:bizhan_study/redux/theme_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'language/style/gsy_string_base.dart';
import 'language/style/gsy_style.dart';
import 'localization/default_localizations.dart';

/**
 * 通用逻辑
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class CommonUtils {
  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static double sStaticBarHeight = 0.0;


  static String getDateStr(DateTime date) {
    if (date == null || date.toString() == null) {
      return "";
    } else if (date.toString().length < 10) {
      return date.toString();
    }
    return date.toString().substring(0, 10);
  }


  ///日期格式转换
  static String getNewsTimeStr(DateTime date) {
    int subTime =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    if (subTime < MILLIS_LIMIT) {
      return "刚刚";
    } else if (subTime < SECONDS_LIMIT) {
      return (subTime / MILLIS_LIMIT).round().toString() + " 秒前";
    } else if (subTime < MINUTES_LIMIT) {
      return (subTime / SECONDS_LIMIT).round().toString() + " 分钟前";
    } else if (subTime < HOURS_LIMIT) {
      return (subTime / MINUTES_LIMIT).round().toString() + " 小时前";
    } else if (subTime < DAYS_LIMIT) {
      return (subTime / HOURS_LIMIT).round().toString() + " 天前";
    } else {
      return getDateStr(date);
    }
  }

  static splitFileNameByPath(String path) {
    return path.substring(path.lastIndexOf("/"));
  }

  static getFullName(String repository_url) {
    if (repository_url != null &&
        repository_url.substring(repository_url.length - 1) == "/") {
      repository_url = repository_url.substring(0, repository_url.length - 1);
    }
    String fullName = '';
    if (repository_url != null) {
      List<String> splicurl = repository_url.split("/");
      if (splicurl.length > 2) {
        fullName =
            splicurl[splicurl.length - 2] + "/" + splicurl[splicurl.length - 1];
      }
    }
    return fullName;
  }

  static pushTheme(Store store, int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = getThemeData(colors[index]);
    store.dispatch(new RefreshThemeDataAction(themeData));
  }

  static getThemeData(Color color) {
    return ThemeData(primaryColor: color, platform: TargetPlatform.android);
  }

  /**
   * 切换语言
   */
  static changeLocale(Store<GSYState> store, int index) {
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

  static GSYStringBase getLocale(BuildContext context) {
    return GSYLocalizations.of(context).currentLocalized;
  }

  static List<Color> getThemeListColor() {
    return [
      GSYColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

  static const IMAGE_END = [".png", ".jpg", ".jpeg", ".gif", ".svg"];

  static isImageEnd(path) {
    bool image = false;
    for (String item in IMAGE_END) {
      if (path.indexOf(item) + item.length == path.length) {
        image = true;
      }
    }
    return image;
  }
}
