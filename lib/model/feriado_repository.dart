import 'dart:convert';
import 'package:flutter_avaliacao_mobile3/model/feriado_model.dart';
import 'package:flutter_avaliacao_mobile3/utils/constantes.dart';
import 'package:http/http.dart' as http;

class FeriadoRepository {
  // Inicializa lista.
  List<Feriado> feriados = [];

  // Url para buscar feriados na API.
  final url = Uri.parse(urlApiFeriados);
  
  // Retorna lista com feriados.
  Future<List<Feriado>> getAll() async {
    // Busca feriados na API.
    final response = await http.get(url);

    // Sucesso na requisição.
    if (response.statusCode == 200) {
      final feriadosList = jsonDecode(response.body) as List;

      // Transforma json em feriado, e adiciona objeto na lista.
      for (var feriado in feriadosList) {
        feriados.add(Feriado.fromJson(feriado));
      }
    }

    return feriados;
  }
}
