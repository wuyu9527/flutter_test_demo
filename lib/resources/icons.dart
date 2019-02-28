import 'package:flutter/material.dart';

///字体图像
///matchTextDirection:从右到左自动镜像
class MyIcons {
  ///微信 &#xe73b;
  static const IconData wechat = const IconData(
      0xe73b, fontFamily: 'IconFont', matchTextDirection: true);

  ///微信登录
  static const IconData wechatLogin = const IconData(
      0xe64b, fontFamily: 'IconFont', matchTextDirection: true);
}