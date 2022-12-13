import 'package:flutter/material.dart';
import 'package:prova_final_prog_flutter/models/selecoes_data.dart';

class Selecoes extends StatefulWidget {
  Selecoes({super.key});

  @override
  State<Selecoes> createState() => _SelecoesState();
}

class _SelecoesState extends State<Selecoes> {
  // final List<SelecoesData> selecoesName;

  // _SelecoesState({Key key @required this.selecoesName}) : super(key:key);

  final listNames = ['Brasil', 'Argentina'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleções'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/registerSelecao');
        },
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: listNames.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.flag,
                    color: Colors.green,
                  ),
                  title: Text(listNames[index]),
                ),
              );
            },
          )),
          Center(
            child: TextButton(
              child: const Text('Cadastrar Jogador'),
              onPressed: () {
                Navigator.pushNamed(context, '/registerPlayer');
              },
            ),
          )
        ],
      ),
      // body: Center(
      //   child: TextButton(
      //     child: const Text('Jogador'),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/registerPlayer');
      //     },
      //   ),
      // ),
    );
  }
}
