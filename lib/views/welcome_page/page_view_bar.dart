import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_doctor/utils/event_bus.dart';

class PageViewBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.bottomCenter,
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 25.0),
          painter: MyPainter(),
        ));
  }
}

class MyPainter extends CustomPainter {
  var mPaint1;
  var mPaint2;

  ///当前下标页面
  var mPosition = 0;

  ///总页数
  var count = 3;

  ///间隔
  var interval = 40;

  MyPainter() {
    mPaint1 = new Paint(); //C7DDEF
    mPaint1.color = Color(0xFFC7DDEF);
    mPaint2 = new Paint(); //1684DD
    mPaint2.color = Color(0xFF1684DD);
  }

  @override
  void paint(Canvas canvas, Size size) {
    //监听登录事件
    bus.on("pageIndex", (arg) {
      mPosition = int.parse(arg);
    });
    var countWidth = size.width / 2 - ((count - 1) * interval + 12) / 2;
    for (int i = 0; i < count; i++) {
      if (i == mPosition) {
        canvas.drawRRect(
            RRect.fromRectXY(
                Rect.fromLTRB(
                  countWidth + interval * i + 18,
                  size.height / 2 - 6,
                  countWidth + interval * i - 6,
                  size.height / 2 + 6,
                ),
                12,
                12),
            mPaint2);
      } else {
        canvas.drawCircle(
            Offset(countWidth + interval * i + 6, size.height / 2), 6, mPaint1);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
    return true;
  }
}
