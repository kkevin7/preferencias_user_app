import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/page/home_page.dart';
import 'package:preferencias_user_app/src/page/setting_page.dart';
import 'package:preferencias_user_app/src/share_prefs/preferencias_usuario.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
  }
 
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