import 'package:flutter/material.dart';
import 'package:flutter_doctor/views/welcome_page/page_view_bar.dart';
import 'package:flutter_doctor/utils/event_bus.dart';

class WelcomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WelcomePageView();
  }
}

final pageImages = [
  "images/welcome_1.jpg",
  "images/welcome_2.jpg",
  "images/welcome_3.jpg",
];

class _WelcomePageView extends State<WelcomePageView> {
  final PageController _pageController = PageController();
  double _currentPage = 0.0;

  _WelcomePageView();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return NotificationListener(
              onNotification: (ScrollNotification note) {
                setState(() {
                  _currentPage = _pageController.page;
                  bus.emit(
                      "pageIndex", _pageController.page.round().toString());
                });
              },
              child: PageView.custom(
                  physics: const PageScrollPhysics(
                    parent: const BouncingScrollPhysics(),
                  ),
                  controller: _pageController,
                  childrenDelegate:
                      SliverChildBuilderDelegate((context, index) {
                    return _SimplePage(index);
                  }, childCount: 3)));
        },
      ),
    );
  }
}

class _SimplePage extends StatelessWidget {
  final int index;

  _SimplePage(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      pageImages[index],
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
    if (index == pageImages.length - 1) {
      return Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.loose,
        children: <Widget>[
          image,
          Container(
            margin: EdgeInsets.all(30.0),
            child: RaisedButton(
              child: Text(
                "进入",
              ),
              onPressed: () => {},
            ),
          )
        ],
      );
    } else {
      return image;
    }
  }
}
