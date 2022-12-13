import 'package:flutter/material.dart';
import 'package:prova_final_prog_flutter/pages/components/button.dart';
import 'package:prova_final_prog_flutter/pages/components/text_form_field_input.dart';
import 'package:prova_final_prog_flutter/pages/components/title_form.dart';

class RegisterPlayer extends StatelessWidget {
  RegisterPlayer({super.key});

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Jogador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(children: [
            const Center(
              child: TitleForm(title: 'Registrar Jogador'),
            ),
            const SizedBox(
              height: 30,
            ),
            MyInputTextFormField(
              hintLabel: 'Nome',
              controller: nameController,
              hiddenText: false,
              returnValidateTextContent: 'Favor, insira o Nome',
            ),
            const SizedBox(
              height: 30,
            ),
            MyInputTextFormField(
              hintLabel: 'Idade',
              controller: ageController,
              hiddenText: false,
              returnValidateTextContent: 'Favor, insira a Idade',
            ),
            const SizedBox(
              height: 30,
            ),
            MyInputTextFormField(
              hintLabel: 'Altura',
              controller: heightController,
              hiddenText: false,
              returnValidateTextContent: 'Favor, insira a Altura',
            ),
            const SizedBox(
              height: 30,
            ),
            MyInputTextFormField(
              hintLabel: 'Peso',
              controller: weightController,
              hiddenText: false,
              returnValidateTextContent: 'Favor insira o Peso',
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
                labelButton: 'Registrar',
                onPressed: () => _onPressedValidatePlayer(context)),
          ]),
        ),
      ),
    );
  }

  void _onPressedValidatePlayer(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/selecoes');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Jogador Registrado com Sucesso'),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 1500),
        ),
      );
    }
  }
}
