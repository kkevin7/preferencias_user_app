import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {

  static final String routeName = 'setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Center(
        child: Text('Ajustes Page'),
      )
    );
  }
}