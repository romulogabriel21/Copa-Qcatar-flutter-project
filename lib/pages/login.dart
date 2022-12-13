import 'package:flutter/material.dart';
import 'package:prova_final_prog_flutter/pages/components/button.dart';
import 'package:prova_final_prog_flutter/pages/components/text_form_field_input.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  final nameValid = 'admin';
  final passwordValid = '12345';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 150,
              ),
              const SizedBox(
                height: 50,
              ),
              MyInputTextFormField(
                  hintLabel: 'Nome',
                  controller: nameController,
                  returnValidateTextContent: 'Favor, insira o Nome',
                  hiddenText: false),
              const SizedBox(
                height: 30,
              ),
              MyInputTextFormField(
                  hintLabel: 'Senha',
                  controller: passwordController,
                  returnValidateTextContent: 'Favor, insira a Senha',
                  hiddenText: true),
              const SizedBox(
                height: 30,
              ),
              Button(
                labelButton: 'Entrar',
                onPressed: () => _onPressedValidateLogin(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedValidateLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;
      final password = passwordController.text;

      if (nameValid == name.toLowerCase() && passwordValid == password) {
        nameController.clear();
        passwordController.clear();
        Navigator.pushNamed(context, '/selecoes');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nome e/ou Senha Invalida'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 2500),
          ),
        );
      }
    }
  }
}
