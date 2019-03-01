import 'package:flutter_doctor/views/views_import.dart';

import 'package:quiver/strings.dart' as Quiver;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_doctor/routers/application.dart';
import 'package:flutter_doctor/utils/shared_preferences.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineState();
  }
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('我的');
  }
}
