import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'loading.dart';
import 'app.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      theme: mDefaultTheme,
      //静态路由，注册用
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => App(),
        "/friends": (_) => WebviewScaffold(
              //Webview插件
              url: "https://flutter.io/",
              appBar: AppBar(
                title: Text("Flutter官网"),
              ),
              withZoom: true,
              withLocalStorage: true,
            ),
      },
      home: LoadingPage(),
    ));
//自定义主题 绿色小清新风格
final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.green,
);
