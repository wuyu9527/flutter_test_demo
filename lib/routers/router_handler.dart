import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

//
//import 'package:flutter_go/components/category.dart';
import '../widgets/404.dart';
import 'package:flutter_doctor/components/full_screen_code_dialog.dart';
import 'package:flutter_doctor/views/web_page/web_view_page.dart';
import 'package:flutter_doctor/views/home.dart';
import 'package:flutter_doctor/views/login/index.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = params['name']?.first;
    String password = params['password']?.first;
    return new AppPage(name,password);
  },
);

var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new Login();
});

var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = params["type"]?.first;

    //return new CategoryHome(name);
    return null;
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String path = params['filePath']?.first;
  return new FullScreenCodeDialog(
    filePath: path,
  );
});

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});
