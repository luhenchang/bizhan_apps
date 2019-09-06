import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class BootomView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _BootomViewState();
  }

}

class _BootomViewState extends State<BootomView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Color.fromARGB(25, 0, 0, 0),
      width:MediaQuery.of(context).size.width,
    );
  }
}