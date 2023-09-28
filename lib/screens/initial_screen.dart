import 'package:curso_alura_primeiro_app/components/task.dart';
import 'package:curso_alura_primeiro_app/data/task_dao.dart';
import 'package:curso_alura_primeiro_app/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                opacidade = !opacidade;
              });
            },
            icon: const Icon(Icons.remove_red_eye),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text('Caregando')
                    ]),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text('Caregando')
                    ]),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text('Caregando')
                    ]),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final Task tarefa = items[index];
                          return tarefa;
                        },
                      );
                    }
                    return const Center(
                      child: Column(children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          'Não há nenhuma tarefa',
                          style: TextStyle(fontSize: 32),
                        ),
                      ]),
                    );
                  }
                  return const Text('Erro ao carregar tarefas');
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
