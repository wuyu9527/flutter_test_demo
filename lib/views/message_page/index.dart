import 'package:flutter_doctor/views/views_import.dart';

import 'package:quiver/strings.dart' as Quiver;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_doctor/routers/application.dart';
import 'package:flutter_doctor/utils/shared_preferences.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _MessageState();
  }
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Text('消息');
  }
}
