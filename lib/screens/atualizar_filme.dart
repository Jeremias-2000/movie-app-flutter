import 'package:avaliacao3_flutter/controller/movie_database.dart';
import 'package:avaliacao3_flutter/pallet%20color/colors.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AtualizarFilme extends StatefulWidget {
  final List list;
  final int index;
  const AtualizarFilme({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  _AtualizarFilmeState createState() => _AtualizarFilmeState();
}

class _AtualizarFilmeState extends State<AtualizarFilme> {
  MovieDatabase movieDatabase = MovieDatabase();
  late String id;
  late DateTime dataLancamento ;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  List<String> generoFilme = MovieDatabase().generos;
  late String generoSelecionado;
  
  @override
  void initState() {
    id = widget.list[widget.index]['id'].toString();
    name = TextEditingController(
        text: widget.list[widget.index]['name'].toString());

    dataLancamento = DateTime.now();

    description = TextEditingController(
        text: widget.list[widget.index]['description'].toString());

    generoSelecionado = widget.list[widget.index]['movieGenre']; //ainda nao
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1830, 3, 1),
        lastDate: DateTime(2022, 12, 31));
    if (pickedDate != null && pickedDate != dataLancamento) {
      setState(() {
        dataLancamento = pickedDate;
      });
    }
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
                  "Atualizar Filme",
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
                  controller: name,
                  onChanged: (text) {
                    name = text as TextEditingController;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Insira o nome do filme',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: button),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: button,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    labelStyle: const TextStyle(
                      fontFamily: "Poppins",
                      color: button,
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
                  controller: description,
                  onChanged: (text) {
                    description = text as TextEditingController;
                  },
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    hintText: 'Insira a descrição do filme',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: button),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: button,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    labelStyle: const TextStyle(
                      fontFamily: "Poppins",
                      color: button,
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
                          DateFormat('dd/MM/yyyy').format(dataLancamento),
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            color: button,
                            fontWeight: FontWeight.w500,
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
                                  color: background, fontFamily: "Alegreya"),
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
                        child: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                      items: generoFilme.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              color: button,
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
                  child: ButtonTheme(// teste
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        movieDatabase.atualizarFilme(id,
                        name.text.trim(),description.text.trim(),dataLancamento, generoSelecionado);
                        Navigator.pop(context, true);
                      },
                      color: appBar,
                      child: const Text(
                        'Atualizar',
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
