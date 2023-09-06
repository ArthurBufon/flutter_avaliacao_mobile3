import 'package:flutter_avaliacao_mobile3/model/aluno_model.dart';
import 'package:flutter_avaliacao_mobile3/model/aluno_repository.dart';

class AlunoController {

  // Injetando alunoRepository.
  AlunoRepository alunoRepository = AlunoRepository();

  // Lista com alunos (objetos).
  List<AlunoEntity> alunosList = [];

  // Retorna lista com alunos.
  Future<List<AlunoEntity>> getAlunosList() async {
    alunosList = await alunoRepository.getAll();
    return alunosList;
  }
}
