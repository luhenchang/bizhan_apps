import 'package:bizhan_study/bean/home/location_bean_entity.dart';
import 'package:bizhan_study/utils/pop_route.dart';
import 'package:bizhan_study/utils/pop_widget.dart';
import 'package:flutter/material.dart';
import 'package:amap_base/amap_base.dart';

class MapFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapFragmentState();
  }
}

class _MapFragmentState extends State<MapFragment> {
  AMapController _controller;
  MyLocationStyle _myLocationStyle = MyLocationStyle();
  final _amapLocation = AMapLocation();
  List<Location> _result = [];
  LocationBeanEntity locationBeanEntity;

  //点点集合
  List<LatLng> mLatList = new List();

  @override
  void initState() {
    super.initState();
    mapInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //地图初始化
  void mapInit() async {
    await AMap.init('5558acd44b9f7d36784380171757d94c');
    //IOS端地图显示需要设置
    //多次定位
    final options = LocationClientOptions(
      isOnceLocation: true,
      locatingWithReGeocode: true,
    );
    _amapLocation.init();
    if (await Permissions().requestPermission()) {
      _amapLocation.getLocation(options).then(_result.add).then((_) {
        if (_result.length > 0) {
          locationBeanEntity =
              LocationBeanEntity.fromJson(_result[_result.length - 1].toJson());
          mLatList.add(
            LatLng(locationBeanEntity.latitude, locationBeanEntity.longitude),
          );
        }
        setState(() {});
      });
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('权限不足')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            _controller.getCenterLatlng().then((lat) {
              print("中心点:=" + lat.toString());
              mLatList.add(lat);
              var markOptionCenter = MarkerOptions(
                  title: "我的圆形",
                  position: LatLng(lat.latitude, lat.longitude),
                  autoOverturnInfoWindow: true,
                  icon: 'images/logo.png',
                  anchorU: 1);
              markOptionCenter.infoWindowEnable = true;
              _controller.addMarker(markOptionCenter);
              var options = new PolylineOptions(
                  latLngList: mLatList,
                  width: 3.0,
                  color: Colors.blue,
                  isDottedLine: true);
              _controller.addPolyline(options);
            });

            setState(() {});
          },
          child: Text('显示地图'),
        ),
      ),
      body: Stack(
        alignment:Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTapDown: (details) {
                  var positionDetails = details.globalPosition;
                  _showExit(context, positionDetails);
                  //showInforWindow(context, positionDetails);
                },
                child: Text("弹窗可怕"),
              ),
              Flexible(
                child: AMapView(
                  onAMapViewCreated: (controller) {
                    _controller = controller;
                    _myLocationStyle.copyWith(
                        image: "images/logo.png",
                        showMyLocation: true,
                        radiusFillColor: Colors.black,
                        strokeWidth: 50,
                        myLocationType: LOCATION_TYPE_FOLLOW_NO_CENTER,
                        showsAccuracyRing: true,
                        interval: 1000);
                    _controller.setMyLocationStyle(_myLocationStyle);
                    UiSettings uiSetting = new UiSettings(
                        isCompassEnabled: true, isRotateGesturesEnabled: false);
                    _controller.setUiSettings(uiSetting);
                    /* int mapType = MAP_TYPE_SATELLITE;
                  _controller.setMapType(mapType);*/
                    setState(() {});
                  },
                  amapOptions: AMapOptions(
                    compassEnabled: false,
                    zoomControlsEnabled: true,
                    logoPosition: LOGO_POSITION_BOTTOM_CENTER,
                    camera: CameraPosition(
                      target: LatLng(40.851827, 111.801637),
                      zoom: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment:Alignment.center,
            height:30,
            width:30,
            child: Text("中",style:TextStyle(color:Colors.orangeAccent,fontWeight:FontWeight.bold),),
            decoration:BoxDecoration(
              color:Colors.lightBlue,
              borderRadius:BorderRadius.all(Radius.circular(350)),
              boxShadow:[
                BoxShadow(color:Colors.orangeAccent,blurRadius:8)
              ]

            ),
          ),
        ],
      ),
    );
  }

  void showInforWindow(BuildContext context, Offset positionDetails) {
    print("哈哈");
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(
        positionDetails.dx,
        positionDetails.dy,
        overlay.size.width - positionDetails.dx,
        overlay.size.height - positionDetails.dy);
    showMenu<String>(
        context: context,
        position: position,
        items: <PopupMenuItem<String>>[
          PopupMenuItem(
            height: 30,
            child: Container(
              color: Colors.redAccent,
              width: 40,
              height: 20,
              child: Text("哈哈"),
            ),
            value: "haha",
          ),
        ]);
  }

  ///构建退出按钮
  Widget _buildExit() {
    return Container(
      color: Colors.white,
      width: 91,
      height: 36,
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/logo.png",
            fit: BoxFit.fill,
          ),
          Center(
            child: Text(
              "退出哈哈",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  ///弹出退出按钮
  ///点击退出调用onClick
  void _showExit(BuildContext context, Offset positionDetails) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(
        positionDetails.dx,
        positionDetails.dy,
        overlay.size.width - positionDetails.dx,
        overlay.size.height - positionDetails.dy);
    Navigator.push(
      context,
      PopRoute(
        child: Popup(
          child: _buildExit(),
          left: positionDetails.dx,
          top: positionDetails.dy + 20,
          onClick: () {
            print("exit");
          },
        ),
      ),
    );
  }
}
