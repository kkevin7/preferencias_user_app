import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    _textController = new TextEditingController(text: _nombre);
    cargarPref();
    super.initState();
  }

  void cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _genero = prefs.getInt('genero');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        drawer: MenuWidget(),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Setting',
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;
                  });
                },
              ),
              RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectRadio,
              ),
              RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectRadio,
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre de la persona usando el teléfono'),
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                ),
              )
            ],
          ),
        ));
  }

  _setSelectRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('genero', value);
    setState(() {
      _genero = value;
    });
  }
}
