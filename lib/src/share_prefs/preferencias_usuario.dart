import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET Y SET del genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }
  
  set genero(int value){
    _prefs.setInt('genero', value);
  }

// GET Y SET del colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }
  
  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }

  // GET Y SET del nombre
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }
  
  set nombre(String value){
    _prefs.setString('nombre', value);
  }

  // GET Y SET del última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }
  
  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }

}
