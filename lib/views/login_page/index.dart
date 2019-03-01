import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_doctor/routers/application.dart';
import 'package:flutter_doctor/utils/shared_preferences.dart';
import 'package:flutter_doctor/resources/icons.dart';
import 'package:flutter_doctor/routers/routers.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    init();
  }

  SpUtil sp;

  init() async {
    sp = await SpUtil.getInstance();
    sp.putBool(SharedPreferencesKeys.showWelcome, false);
  }

  void _textFieldChanged(String str) {
    print(str);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Theme(
      data: new ThemeData(primaryColor: Colors.blue),
      child: Material(
        color: Colors.white,
        child: SafeArea(
            top: true,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset('images/pgug.jpg'),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      '登录页面',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TextField(
                      enableInteractiveSelection: false,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          icon: null,
                          labelText: '请输入账号',
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          )),
                      onChanged: _textFieldChanged,
                      controller: nameController,
                      autofocus: false,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TextField(
                      obscureText: true,
                      enableInteractiveSelection: false,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          icon: null,
                          labelText: '请输入密码',
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          )),
                      onChanged: _textFieldChanged,
                      controller: passwordController,
                      autofocus: false,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: FlatButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text("Submit"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Application.router.navigateTo(context,
                            "${Routes.home}?name=${nameController.text}&password=${passwordController.text}");
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    height: 1.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Icon(
                      MyIcons.wechatLogin,
                      color: Color(0xFF50B674),
                      size: 45.0,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
