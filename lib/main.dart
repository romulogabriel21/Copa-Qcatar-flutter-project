import 'package:flutter/material.dart';
import 'package:prova_final_prog_flutter/pages/login.dart';
import 'package:prova_final_prog_flutter/pages/register_player.dart';
import 'package:prova_final_prog_flutter/pages/register_selecao.dart';
import 'package:prova_final_prog_flutter/pages/selecoes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/selecoes': (context) => Selecoes(),
        '/registerSelecao': (context) => RegisterSelecao(),
        '/registerPlayer': (context) => RegisterPlayer(),
      },
    );
  }
}
