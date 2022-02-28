import 'package:avaliacao3_flutter/controller/movie_database.dart';
import 'package:avaliacao3_flutter/pallet%20color/colors.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdicionarFilme extends StatefulWidget {
  const AdicionarFilme({Key? key}) : super(key: key);

  @override
  _AdicionarFilmeState createState() => _AdicionarFilmeState();
}

class _AdicionarFilmeState extends State<AdicionarFilme> {
  MovieDatabase movieDatabase = MovieDatabase();
  DateTime date = DateTime.now();
  

  late String name;
  late String description;
  List<String> generoFilme = MovieDatabase().generos;
  String generoSelecionado = 'ACTION';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1830, 3, 1),
        lastDate: DateTime(2022, 12, 31));
    if (pickedDate != null && pickedDate != date)
      setState(() {
        date = pickedDate;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Adicionar Filme",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: darkColor,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  autofocus: true,
                  onChanged: (text) {
                    name = text;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Insira o nome do filme',
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
                  height: 30,
                ),
                TextField(
                  autofocus: true,
                  onChanged: (text) {
                    description = text;
                  },
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    hintText: 'Insira a descrição do filme',
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
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(
                      color: button,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          DateFormat.yMd().format(date),
                          style: const TextStyle(
                            color: button,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: RaisedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text(
                              'Select date',
                              style: TextStyle(
                                color: background,
                                fontFamily: "Alegreya",
                              ),
                            ),
                            color: appBar,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(
                      color: button,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DropdownButton(
                      value: generoSelecionado,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 190),
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      items: generoFilme.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                              color: button,
                              fontFamily: "Poppins",
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          generoSelecionado = newValue!;
                        });
                      },
                      autofocus: true,
                      focusColor: button,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 44,
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
                        movieDatabase.salvarFilme(
                            name.trim(),description.trim(),date, generoSelecionado);
                        Navigator.pop(context, true);
                      },
                      color: appBar,
                      child: const Text(
                        'Adicionar',
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
        backgroundColor: background,
      ),
    );
  }
}
