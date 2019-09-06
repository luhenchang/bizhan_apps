import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

void main() => runApp(new HomeFragment());

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}

class _HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Widget> tween;
  var radius = 44.0;
  double xs=1.0;
  double ys=1.0;
  //50-200之间到数字。我们要变成-2.3到2.3之间到数字。-2.3到2.3之间是=4.6
  //50到200
  //4.6除以150是变化速度差。
  @override
  void initState() {
    super.initState();
    animationController =
    new AnimationController(duration: Duration(seconds:4), vsync: this);

    tween =new Tween<Widget>(begin:Container(width:50.0,height:50.0,color:Colors.red,), end:Container(width:100.0,height:100.0,color:Colors.yellowAccent),).animate(animationController);
    tween.addListener(() {
      setState(() {
      });
    });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: new Center(
            child: Stack(
              alignment:Alignment(xs,ys),//-1到1直接
              children: <Widget>[
                Container(
                  width:300.0,
                  height:500,
                ),
                Container(
                  child:tween.value,
                ),
              ],
            ),
          )),
    );
  }
}
