import 'package:avaliacao3_flutter/controller/movie_database.dart';
import 'package:avaliacao3_flutter/pallet%20color/colors.dart';
import 'package:avaliacao3_flutter/widgets/item_lista_filmes.dart';
import 'package:flutter/material.dart';
import 'adicionar_filme.dart';


class ListarFilmes extends StatefulWidget {
  
  const ListarFilmes({ Key? key }) : super(key: key);

  @override
  _ListarFilmesState createState() => _ListarFilmesState();
}

class _ListarFilmesState extends State<ListarFilmes> {

  MovieDatabase movieDatabase = MovieDatabase();
  late List data;

  
  //retirar isso e usar rotas
  _navigateAddMovie(BuildContext context) async {
    final result = await Navigator.push(context,
    MaterialPageRoute(builder: (context) =>  AdicionarFilme()));

    if(result){
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
   
    super.initState();
    movieDatabase.getFilmes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Movies App.png",
          width: 150,
        ),
        backgroundColor: appBar,
        actions: [
          IconButton(
            onPressed: () => _navigateAddMovie(context),
            icon: Icon(Icons.add),
            iconSize: 35,
          )
        ],
      ),
      body:
      FutureBuilder<List>(
        future: movieDatabase.getFilmes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? ItensListaFilmes(
                list: snapshot.data ?? [],
              )
              : Center(
                child: CircularProgressIndicator(),
              );
        },
      ),
      backgroundColor:background,
    );
  }
}

