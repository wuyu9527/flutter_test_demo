import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import 'routers/application.dart';

import 'utils/shared_preferences.dart';
import 'utils/provider.dart';
import 'model/search_history.dart';
import 'views/welcome_page/index.dart';
import 'package:flutter_doctor/views/home.dart';

const int ThemeColor = 0xFFC91B3A;
SpUtil sp;
var db;

void main() async {
  //final provider = Provider();
  //await provider.init(true);
  sp = await SpUtil.getInstance();
  SearchHistoryList(sp);
  //db = Provider.db;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;
  }

  showWelcomePage() {
    bool showWelcome = sp.getBool(SharedPreferencesKeys.showWelcome);
    if (showWelcome == null || showWelcome == true) {
      //第一次展示欢迎页面
      return WelcomePage();
    } else {
      //直接进入主页
      String name = sp.getString(SharedPreferencesKeys.name);
      String password = sp.getString(SharedPreferencesKeys.password);
      if (name.isNotEmpty && password.isNotEmpty) {
        return null;
      } else {
        return AppPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      theme: ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(color: Color(ThemeColor), size: 35.0),
      ),
      home: Scaffold(
        body: showWelcomePage(),
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
