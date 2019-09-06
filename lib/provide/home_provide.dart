import 'dart:convert';

import 'package:bizhan_study/bean/home_page_bean_entity.dart';
import 'package:bizhan_study/utils/HttpUtlils.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeBeanProvide extends Model {
  List<HomePageBeanResobj> _mHomeData = new List();

  //1。网络请求
  getDataServer(String url, callBack) async {
    HttpUtils.getHttp(
        url: url,
        onCallBack: (value) {
          json.decode(value);
          HomePageBeanEntity homeBeanEntity =
              HomePageBeanEntity.fromJson(json.decode(value));
          _mHomeData.addAll(homeBeanEntity.resobj);
          callBack();
        });
  }

  //删除数据
  deletIndex(int index) {
    _mHomeData.removeAt(index);
    notifyListeners();
  }
  //0个的数据替换了
  setLiveTitleName(int index,titleName){
    _mHomeData[index].liveTitleName=titleName;
    notifyListeners();//刷新子节点。通知到ScodeModle<HomePageProvide>
  }
  //2。返回数据
  List<HomePageBeanResobj> get mData => _mHomeData;

  static HomeBeanProvide of(BuildContext context) =>
      ScopedModel.of<HomeBeanProvide>(context);
}
