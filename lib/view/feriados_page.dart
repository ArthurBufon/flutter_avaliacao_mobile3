import 'package:flutter/material.dart';
import 'package:flutter_avaliacao_mobile3/controller/feriado_controller.dart';
import 'package:flutter_avaliacao_mobile3/model/feriado_model.dart';
import 'package:flutter_avaliacao_mobile3/view/alunos_page.dart';
import 'package:intl/intl.dart';

class FeriadosPage extends StatefulWidget {
  const FeriadosPage({super.key});

  @override
  State<FeriadosPage> createState() => _FeriadosPageState();
}

class _FeriadosPageState extends State<FeriadosPage> {
  FeriadoController feriadoController = FeriadoController();

  // Formatar data.
  final f = DateFormat('yyyy-MM-dd hh:mm');

  // Inicializando lista de feriados.
  late Future<List<Feriado>> future;

  // Retorna lista com todos os feriados.
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
        title: const Center(
          child: Text("Feriados 2023"),
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
        child: FutureBuilder<List<Feriado>>(
          future: future,
          builder: (context, AsyncSnapshot<List<Feriado>> snapshot) {
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
                      child: ListTile(
                        leading: const Icon(Icons.calendar_month),
                        // title: Text(
                        //   '${snapshot.data![index].date}',
                        // style: const TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        // ),
                        title: Text(
                          '${snapshot.data![index].name}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat("d 'de' MMMM 'de' y").format(
                            DateTime.parse(snapshot.data![index].date!),
                          ),
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
