import 'package:flutter/material.dart';
import 'package:flutter_avaliacao_mobile3/controller/feriado_controller.dart';
import 'package:flutter_avaliacao_mobile3/model/feriado_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FeriadosPage extends StatefulWidget {
  const FeriadosPage({super.key});

  @override
  State<FeriadosPage> createState() => _FeriadosPageState();
}

class _FeriadosPageState extends State<FeriadosPage> {
  FeriadoController feriadoController = FeriadoController();

  // Lista de feriados.
  late Future<List<Feriado>> future;

  // Função busca todos os feriados.
  Future<List<Feriado>> getFeriados() async {
    return feriadoController.getFeriadosList();
  }

  @override
  void initState() {
    super.initState();
    future = getFeriados();
  }

  @override
  Widget build(BuildContext context) {
    // PrimaryColor.
    Color primaryColor = Theme.of(context).primaryColor;

    // Scaffold.
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Feriados")),
      ),
      body: FutureBuilder<List<Feriado>>(
        future: future,
        builder: (context, AsyncSnapshot<List<Feriado>> snapshot) {
          // Lista com todos os feriados.
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Card(
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: "Alterar",
                          ),
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: "Excluir",
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.brown.shade800,
                          child: Text("A"),
                        ),
                        title: Text('${snapshot.data![index].date}'),
                        subtitle: Text('${snapshot.data![index].name}'),
                      ),
                    ),
                  ),
                );
              },
            );
          } 
          // Se não tiver dados, exibe widget carregando...
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
