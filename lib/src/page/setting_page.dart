import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_user_app/src/widgets/menu_widget.dart';

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
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    prefs.ultimaPagina= SettingPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
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
                    prefs.colorSecundario = value;
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
                      prefs.nombre = value;
                      _nombre = value;
                    });
                  },
                ),
              )
            ],
          ),
        ));
  }

  _setSelectRadio(int value)  {
    setState(() {
      prefs.genero = value;
      _genero = value;
    });
  }
}
