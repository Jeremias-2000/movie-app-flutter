
// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

 

class MovieDatabase {

 List<String> generos = ["ACTION", "ANIMATION"," ADVENTURE", "COMEDY", 
 "DOCUMENTARY"," FANTASY",
  "WESTERN", 
 "SCIENCEFICTION", "WAR", "MUSICALS", "ROMANCE","HORROR", "THRILLER", "DRAMA"];

  //retornar filmes
  Future<List> getFilmes () async{
    final response = await http.get(Uri.parse("https://movie-apir10.herokuapp.com/api/v1/movies/movies"));
    return json.decode(response.body);
  }
  

  //adicionar novo filme
  Future<http.Response> salvarFilme(String nome,String descricao,DateTime dataLancamento,String generoFilme) async {
    final teste = DateFormat.yMd().format(dataLancamento);  // esta formatando a data mas ainda nao esta no padrao pt-BR

    
    Map data = {
      'name': nome,
      'date': teste ,
      'description':descricao,
      'movieGenre': generoFilme,
      
    };
    var body = json.encode(data);
    print(data);

    var response = await http.post(Uri.parse("https://movie-apir10.herokuapp.com/api/v1/movies/movie/register"),
    headers: {
      "Content-Type": "application/json"
    },
    body: body);
    print(response.statusCode);
    print(response.body);
    return response;
  }

  //atualizar um filme existente
  Future<http.Response> atualizarFilme(String id,String nome,String descricao,DateTime dataLancamento,String generoFilme) async {
   final teste = DateFormat.yMd().format(dataLancamento);  // esta formatando a data mas ainda nao esta no padrao pt-BR
    Map data = {
       'name': nome,
      'date': teste,
      'description':descricao,
      'movieGenre': generoFilme,
      
    };
    var body = json.encode(data);
    
    var response = await http.put(Uri.parse("https://movie-apir10.herokuapp.com/api/v1/movies/movie/update/id/$id"),
    headers: {
      "Content-Type": "application/json",
    },
    body: body,);
    print(response.statusCode); 
    print(response.body);
    print(data);
    return response;
  }

  //deletar um filme existente
  Future<http.Response> removerFilme(String id) async {
    
    print(id);
    var response = await http.delete(Uri.parse("https://movie-apir10.herokuapp.com/api/v1/movies/movie/delete/id/$id"),
      headers: {
      "Content-Type": "application/json"
    },
    );
    print(response.statusCode);
    return response;
  }
}



