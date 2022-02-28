import 'package:avaliacao3_flutter/pallet%20color/colors.dart';
import 'package:avaliacao3_flutter/screens/detalhe_filme.dart';
import 'package:flutter/material.dart';

class ItensListaFilmes extends StatelessWidget {
  final List list;
  ItensListaFilmes({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => DetalheFilme(
                      list: list,
                      index: i,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 101,
                  child: Card(
                    color: button,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row( 
                                mainAxisAlignment: MainAxisAlignment.center,                               
                                children: [
                                  Text(
                                    list[i]['name'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color:textButton,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      list[i]['movieGenre'].toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color:textButton,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
