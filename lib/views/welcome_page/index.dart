import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_doctor/views/welcome_page/welcome_page_view.dart';
import 'package:flutter_doctor/views/welcome_page/page_view_bar.dart';


class WelcomePage extends StatefulWidget{
  WelcomePage({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:Alignment.center ,
      children: <Widget>[
        WelcomePageView(),
        PageViewBar(),
      ],
    );
  }

}