import 'package:flutter/material.dart';

void main() => runApp(new HomeFragment());

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}
class _HomeFragmentState extends State<HomeFragment> {
  bool isVisible = false;

  var editerTextControner = TextEditingController();

  var mTextFiledController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 250, 150, 150)),
      home: Scaffold(
        appBar: AppBar(
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
                        border: Border.all(color: Colors.white, width: 1)),
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
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
        ),
        body: new ListView(
          children: <Widget>[
            //TODO  基本的输入框
            //1.EditableText
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.center,
              height:MediaQuery.of(context).padding.top,
              width:MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_alarm),
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        alignment: Alignment.center,
                        height: 36.0,
                        width: 200,
                        child: EditableText(
                          controller: editerTextControner,
                          focusNode: FocusNode(),
                          style: TextStyle(color: Colors.red),
                          cursorColor: Colors.blue,
                          textDirection: TextDirection.ltr,
                          cursorWidth: 4.0,
                          cursorRadius: Radius.circular(11.0),
                          onChanged: (result) {
                            print(result);
                            print(editerTextControner.text + "haha");
                          },
                          textInputAction: TextInputAction.emergencyCall,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.phone),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
            //TODO 2.0 TextField
            Container(
              margin:EdgeInsets.all(22.0),
              width: 200.0,
              height: 40.0,
              child: TextField(
                controller: mTextFiledController,
                focusNode: FocusNode(),
                decoration: InputDecoration(
                /*  icon: Icon(
                    Icons.perm_identity,
                    color: Colors.green,
                  ),*/
                  labelText: "请输入你的密码:",
                  labelStyle: TextStyle(color: Colors.blue),
                  helperText:"不行你太可爱了",
                  suffixIcon:Icon(Icons.print),
                  prefixIcon:Icon(Icons.arrow_back),
                  border:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(31.0))),
                  enabled:true,
                ),
              ),
            ),
            TextFormField(

            )
          ],
        ),
      ),
    );
  }
}
