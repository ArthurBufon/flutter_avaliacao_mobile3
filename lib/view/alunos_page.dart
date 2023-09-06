import 'package:flutter/material.dart';
import 'package:flutter_avaliacao_mobile3/model/aluno_model.dart';
import 'package:flutter_avaliacao_mobile3/controller/aluno_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AlunosPage extends StatefulWidget {
  const AlunosPage({super.key});

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  AlunoController alunoController = AlunoController();

  late Future<List<AlunoEntity>> future;

  Future<List<AlunoEntity>> getAlunos() async {
    return alunoController.getAlunosList();
  }

  @override
  void initState() {
    super.initState();
    future = getAlunos();
  }

  @override
  Widget build(BuildContext context) {
    // PrimaryColor.
    Color primaryColor = Theme.of(context).primaryColor;

    // Scaffold.
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Alunos")),
      ),
      body: FutureBuilder<List<AlunoEntity>>(
        future: future,
        builder: (context, AsyncSnapshot<List<AlunoEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
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
                      title: Text('${snapshot.data![index].nome}'),
                      subtitle: Text('${snapshot.data![index].email}'),
                    ),
                  ),
                );
              },
            );
          } else {
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
