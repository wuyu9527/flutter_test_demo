///首页
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:quiver/strings.dart' as Quiver;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_doctor/routers/application.dart';
import 'package:flutter_doctor/utils/shared_preferences.dart';
import 'message_page/index.dart';
import 'all_list_page/index.dart';
import 'mine_page/index.dart';

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
  TabController tabController;
  String appBarTitle = tabData[0]['text'];

  static List tabData = [
    {'text': '信息', 'icon': new Icon(Icons.message)},
    {'text': '列表', 'icon': new Icon(Icons.view_list)},
    {'text': '我的', 'icon': new Icon(Icons.perm_identity)},
  ];

  List<Widget> myTabs = [];

  @override
  void initState() {
    super.initState();
    init();
    tabController = new TabController(
        initialIndex: 0, vsync: this, length: 3); // 这里的length 决定有多少个底导 submenus
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(new Tab(text: tabData[i]['text'], icon: tabData[i]['icon']));
    }
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        _onItemTapped(tabController.index);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  SpUtil sp;

  init() async {
    sp = await SpUtil.getInstance();
    if (Quiver.isNotEmpty(widget.name) && Quiver.isNotEmpty(widget.password)) {
      sp.putString(SharedPreferencesKeys.name, widget.name);
      sp.putString(SharedPreferencesKeys.password, widget.password);
    }
  }

  ///自定义AppBar
  Widget buildBar(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildBar(context),
      ),
      body: TabBarView(
          controller: tabController,
          children: <Widget>[Message(), AllList(), Mine()]),
      bottomNavigationBar: Material(
        color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
        child: SafeArea(
          child: Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFd0d0d0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  //offset: Offset(-1.0, -1.0),
                ),
              ],
            ),
            child: TabBar(
                controller: tabController,
                //tab标签的下划线颜色
                indicatorColor: Colors.transparent,
                // labelColor: const Color(0xFF000000),
                indicatorWeight: 3.0,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: const Color(0xFF8E8E8E),
                tabs: myTabs),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (this.mounted) {
      this.setState(() {
        appBarTitle = tabData[index]['text'];
      });
    }
  }
}
