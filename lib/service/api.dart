import 'package:dio/dio.dart';
import 'package:prova_final_prog_flutter/models/selecoes_data.dart';

class ApiService {
  final Dio dio = Dio();

  final url = 'http://localhost:3000/selecoes';

  Future<List<SelecoesData>> getSelecoes() async {
    Response response = await dio.get(url);

    final selecoes =
        (response.data as List).map((item) => SelecoesData.fromJson(item));

    return selecoes.toList();
  }

  Future<SelecoesData?> addSelecao(SelecoesData selecao) async {
    SelecoesData? selecaoRegistrada;

    try {
      Response response = await dio.post(url, data: selecao.toJson());

      selecaoRegistrada = SelecoesData.fromJson(response.data);
    } catch (e) {
      print("Erro: $e");
    }

    return selecaoRegistrada;
  }

  Future<SelecoesData?> delSelecao(int id) async {
    int? id;
    try {
      await dio.delete("$url/$id");
    } catch (e) {
      print("Erro: $e");
    }
  }
}
