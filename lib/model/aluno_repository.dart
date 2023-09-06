import 'dart:convert';
import 'package:flutter_avaliacao_mobile3/model/aluno_model.dart';
import 'package:flutter_avaliacao_mobile3/utils/constantes.dart';
import 'package:http/http.dart' as http;

class AlunoRepository {
  // Lista com objetos AlunoEntity.
  List<AlunoEntity> alunos = [];
  final url = Uri.parse('$urlBaseApi/alunos');
  
  // Retorna todos os alunos.
  Future<List<AlunoEntity>> getAll() async {
    final response = await http.get(url);

    // Sucesso na requisição.
    if (response.statusCode == 200) {
      final alunosList = jsonDecode(response.body) as List;

      // Adiciona users na lista de objetos.
      for (var user in alunosList) {
        alunos.add(AlunoEntity.mapToEntity(user));
      }
    }

    // Retorna lista com objetos AlunoEntity.
    return alunos;
  }
}
