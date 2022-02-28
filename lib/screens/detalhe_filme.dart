import 'package:avaliacao3_flutter/controller/movie_database.dart';
import 'package:avaliacao3_flutter/pallet%20color/colors.dart';
import 'package:avaliacao3_flutter/screens/atualizar_filme.dart';
import 'package:avaliacao3_flutter/screens/listar_filmes.dart';
import 'package:flutter/material.dart';

class DetalheFilme extends StatefulWidget {
  List list;
  int index;
  DetalheFilme({required this.list, required this.index});

  @override
  _DetalheFilmeState createState() => _DetalheFilmeState();
}

class _DetalheFilmeState extends State<DetalheFilme> {
  MovieDatabase databaseHelper = MovieDatabase();

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListarFilmes()),
    );

    if (result) {
      setState(() {});
    }
  }

  //create function delete
  void confirm() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //removi o new aqui

            content: Text("Remover  '${widget.list[widget.index]['name']}' ?"),
            actions: <Widget>[
              RaisedButton(
                child: const Text(
                  "OK remove!",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.red,
                onPressed: () {
                  databaseHelper
                      .removerFilme(widget.list[widget.index]['id'].toString());
                  _navigateList(context);
                },
              ),
              RaisedButton(
                child: const Text("CANCELAR",
                    style: TextStyle(color: Colors.black)),
                color: Colors.green,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
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
      ),
      backgroundColor: background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sinopse",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              color: darkColor,
              fontSize: 35,
            ),
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: button,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.list[widget.index]['name'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: textButton,
                        fontFamily: "Alegreya",
                      ),
                    ),
                    Divider(),
                    Text(
                      "Data : ${widget.list[widget.index]['date']}",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: textButton,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Text(
                        widget.list[widget.index]['description'],
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                          color: textButton,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            "Atualizar",
                            style: TextStyle(
                              color: textButton,
                              fontFamily: "Alegreya",
                            ),
                          ),
                          color: darkColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AtualizarFilme(
                              list: widget.list,
                              index: widget.index,
                            ),
                          )),
                        ),
                        VerticalDivider(),
                        RaisedButton(
                          child: Text(
                            "Deletar",
                            style: TextStyle(
                              color: textButton,
                              fontFamily: "Alegreya",
                            ),
                          ),
                          color: darkColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () => confirm(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
