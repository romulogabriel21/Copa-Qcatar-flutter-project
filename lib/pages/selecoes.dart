import 'package:flutter/material.dart';
import 'package:prova_final_prog_flutter/models/selecoes_data.dart';
import 'package:prova_final_prog_flutter/pages/ondismissible.dart';
import 'package:prova_final_prog_flutter/service/api.dart';

class Selecoes extends StatefulWidget {
  const Selecoes({super.key});

  @override
  State<Selecoes> createState() => _SelecoesState();
}

class _SelecoesState extends State<Selecoes> {
  Future<void> removeSelecao(SelecoesData selecao) async {
    await ApiService().delSelecao(selecao.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleções'),
        leading: IconButton(
          icon: Image.asset(
            'assets/logout.png',
            color: Colors.white,
            width: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
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
            child: FutureBuilder<List<SelecoesData>>(
              future: ApiService().getSelecoes(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 15,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final selecao = snapshot.data![index];

                      return OnDismiss(
                        selecao: selecao,
                        ondismiss: removeSelecao,
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
