import 'package:http/http.dart' as http;
import 'dart:convert';

class DataBaseHelper(){
  //Agregar Usuario

  Future<http.Response> addUser(String correoController, String tipoDeporteController) async{}
  var url = 'http://localhost:8787/addUser';
  Map data = {
    'correo': '$correoController',
    'tipo_deporte': '$tipoDeporteController'
  };

  var body = json.enconde(data);

  var response = await http.post(url,
  headers: {"Content-Type":"application/json"},body: body);
  print("${response.statusCode}");
  print("${response.body}");

  return response;

  //Actualizar Usuario

  //Eliminar Usuario
}