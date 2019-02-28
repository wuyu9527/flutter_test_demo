///首页
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:quiver/strings.dart' as Quiver;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_doctor/routers/application.dart';
import 'package:flutter_doctor/utils/shared_preferences.dart';

const int ThemeColor = 0xFFC91B3A;

class AppPage extends StatefulWidget {
  final String name;
  final String password;

  AppPage(this.name, this.password);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    init();
  }

  SpUtil sp;

  init() async {
    sp = await SpUtil.getInstance();
    if (Quiver.isNotEmpty(widget.name) && Quiver.isNotEmpty(widget.password)) {
      sp.putString(SharedPreferencesKeys.name, widget.name);
      sp.putString(SharedPreferencesKeys.password, widget.password);
      print("$widget.name:$widget.passwrod");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('主页');
  }
}
