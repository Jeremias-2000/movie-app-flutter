import 'package:avaliacao3_flutter/screens/login.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Filmes Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity 
      ),
      //criar rota inicial initialRoute
      //e as os caminhos subsequentes 
      home: Login(),
    );
  }
}