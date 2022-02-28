import 'package:avaliacao3_flutter/controller/movie_database.dart';
import 'package:avaliacao3_flutter/pallet%20color/colors.dart';
import 'package:avaliacao3_flutter/screens/listar_filmes.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  MovieDatabase movieDatabase = MovieDatabase();

  late String senha;
  late String email;
  _navigateListarFilmes(BuildContext context) async {
    final result = await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ListarFilmes()));

    if (result) {
      setState(() {});
    }
  }
   void loginError() {
    
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Falha no Login"),
            content: const Text("Email ou senha informada não existe"),
            actions: <Widget> [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                Navigator.of(context).pop();
              },)
            ],
            
          );
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              "assets/images/Movies App.png",
              width: 150,
            ),
            backgroundColor: appBar,
          ),
          backgroundColor: background,
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Realize seu login:",
                      style: TextStyle(
                        color: darkColor,
                        fontSize: 25,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      autofocus: true,
                      onChanged: (text) {
                        email = text;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Insira o seu email',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: button),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: button),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        labelStyle: const TextStyle(
                          color: button,
                          fontFamily: "Poppins",
                        ),
                        filled: true,
                        fillColor: Colors.white54,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      obscureText: true,
                      autofocus: true,
                      onChanged: (text) {
                        senha = text;
                      },
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Insira sua senha',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: button),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: button),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        labelStyle: const TextStyle(
                          color: button,
                          fontFamily: "Poppins",
                        ),
                        filled: true,
                        fillColor: Colors.white54,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            if (email == 'teste@gmail.com' &&
                                senha == 'teste123') {
                              _navigateListarFilmes(context);
                            }else{
                              loginError();
                            }
                          },
                          color: appBar,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: background,
                              fontSize: 20,
                              fontFamily: "Alegreya",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
