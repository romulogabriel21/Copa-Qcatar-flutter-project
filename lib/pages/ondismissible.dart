import 'package:flutter/material.dart';
import 'package:prova_final_prog_flutter/models/selecoes_data.dart';
import 'package:prova_final_prog_flutter/service/api.dart';

class OnDismiss extends StatelessWidget {
  final SelecoesData selecao;
  final Function(SelecoesData selecao) ondismiss;

  const OnDismiss({
    Key? Key,
    required this.selecao,
    required this.ondismiss,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => ondismiss(selecao),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
        ),
        // color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Image.asset(
            'assets/flag.png',
            width: 25,
            color: Colors.grey,
          ),
          title: Text('${selecao.name}'),
        ),
      ),
    );
  }
}
