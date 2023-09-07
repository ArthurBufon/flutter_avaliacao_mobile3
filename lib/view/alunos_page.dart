import 'package:flutter/material.dart';
import 'package:flutter_avaliacao_mobile3/model/aluno_model.dart';
import 'package:flutter_avaliacao_mobile3/controller/aluno_controller.dart';
import 'package:flutter_avaliacao_mobile3/view/feriados_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AlunosPage extends StatefulWidget {
  const AlunosPage({super.key});

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  AlunoController alunoController = AlunoController();

  // Inicializando lista de alunos.
  late Future<List<AlunoEntity>> future;

  // Retorna lista com todos os alunos.
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
        title: const Center(
          child: Text("Alunos"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // Header.
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: const Center(
                  child: Text(
                'Alunos App',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),

            // Alunos
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Alunos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlunosPage(),
                  ),
                );
              },
            ),

            // Feriados
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Feriados'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeriadosPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<AlunoEntity>>(
          future: future,
          builder: (context, AsyncSnapshot<List<AlunoEntity>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 222, 222, 222),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
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
                            backgroundColor: primaryColor,
                            child: Text(snapshot.data![index].nome![0]),
                          ),
                          title: Text('${snapshot.data![index].nome}'),
                          subtitle: Text('${snapshot.data![index].email}'),
                        ),
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
