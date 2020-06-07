import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/widgets/menu_widget.dart';

class SettingPage extends StatelessWidget {

  static final String routeName = 'setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Ajustes Page'),
      )
    );
  }
}