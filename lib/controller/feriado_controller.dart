
import 'package:flutter_avaliacao_mobile3/model/feriado_model.dart';
import 'package:flutter_avaliacao_mobile3/model/feriado_repository.dart';

class FeriadoController {

  // Injetando FeriadoRepository.
  FeriadoRepository feriadoRepository = FeriadoRepository();

  // Lista com feriados (objetos).
  List<Feriado> feriadosList = [];

  // Retorna lista com feriados.
  Future<List<Feriado>> getFeriadosList() async {
    feriadosList = await feriadoRepository.getAll();
    return feriadosList;
  }
}
