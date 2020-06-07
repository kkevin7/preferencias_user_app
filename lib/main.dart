import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/page/home_page.dart';
import 'package:preferencias_user_app/src/page/setting_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingPage.routeName : (BuildContext context) => SettingPage(),
      },
    );
  }
}