import 'package:flutter/material.dart';

class MainActivityBootom extends StatefulWidget {
  ValueChanged onTableCallBack;
  var selectedIndex;

  MainActivityBootom(this.onTableCallBack, this.selectedIndex);

  @override
  State<StatefulWidget> createState() {
    return StateMainActivityBootom();
  }
}

class StateMainActivityBootom extends State<MainActivityBootom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: () {
            widget.selectedIndex = 0;
            widget.onTableCallBack(0);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.account_balance,
                color: widget.selectedIndex == 0
                    ? Color.fromARGB(255, 235, 122, 153)
                    : Color.fromARGB(255, 122, 122, 122),
              ),
              Text(
                "首页",
                style: TextStyle(
                  color: widget.selectedIndex == 0
                      ? Color.fromARGB(255, 235, 122, 153)
                      : Color.fromARGB(255, 122, 122, 122),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.selectedIndex = 1;
            widget.onTableCallBack(1);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.live_tv,
                color: widget.selectedIndex == 1
                    ? Color.fromARGB(255, 235, 122, 153)
                    : Color.fromARGB(255, 122, 122, 122),
              ),
              Text(
                "频道",
                style: TextStyle(
                  color: widget.selectedIndex == 1
                      ? Color.fromARGB(255, 235, 122, 153)
                      : Color.fromARGB(255, 122, 122, 122),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.selectedIndex = 2;
            widget.onTableCallBack(2);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.move_to_inbox,
                color: widget.selectedIndex == 2
                    ? Color.fromARGB(255, 235, 122, 153)
                    : Color.fromARGB(255, 122, 122, 122),
              ),
              Text(
                "动态",
                style: TextStyle(
                  color: widget.selectedIndex == 2
                      ? Color.fromARGB(255, 235, 122, 153)
                      : Color.fromARGB(255, 122, 122, 122),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.selectedIndex = 3;
            widget.onTableCallBack(3);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: widget.selectedIndex == 3
                    ? Color.fromARGB(255, 235, 122, 153)
                    : Color.fromARGB(255, 122, 122, 122),
              ),
              Text(
                "会员购",
                style: TextStyle(
                  color: widget.selectedIndex == 3
                      ? Color.fromARGB(255, 235, 122, 153)
                      : Color.fromARGB(255, 122, 122, 122),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
