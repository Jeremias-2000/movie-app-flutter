import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController{
  
  Future<http.Response> autenticarUsuario(String email,String senha) async {
    
    Map data = {
      'email': email,
      'senha': senha,
      
    };
    
    var body = json.encode(data);
    var response = await http.post(Uri.parse('rota para autenticar usuario'),
    headers: {
      "Content-Type": "application/json"
    },
    body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200){
      print("Deu certo");
    }
    return response;
  }
}