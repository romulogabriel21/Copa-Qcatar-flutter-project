import 'package:flutter/material.dart';
import 'package:prova_final_prog_flutter/pages/components/button.dart';
import 'package:prova_final_prog_flutter/pages/components/text_form_field_input.dart';
import 'package:prova_final_prog_flutter/pages/components/title_form.dart';

class RegisterSelecao extends StatelessWidget {
  RegisterSelecao({super.key});

  final nameSelecaoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Seleção'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(children: [
            const Center(
              child: TitleForm(title: 'Registrar Seleção'),
            ),
            const SizedBox(
              height: 40,
            ),
            MyInputTextFormField(
                hintLabel: 'Nome da Seleção',
                controller: nameSelecaoController,
                hiddenText: false,
                returnValidateTextContent: 'Favor, insira o nome da Seleção'),
            const SizedBox(
              height: 30,
            ),
            Button(
                labelButton: 'Registrar',
                onPressed: () => _onPressedValidateSelecao(context)),
          ]),
        ),
      ),
    );
  }

  void _onPressedValidateSelecao(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/selecoes');
      nameSelecaoController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seleção Registrada com Sucesso'),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 1500),
        ),
      );
    }
  }
}
