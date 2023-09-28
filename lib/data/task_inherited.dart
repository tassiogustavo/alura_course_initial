import 'package:curso_alura_primeiro_app/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task(
      'Andar de Bike',
      'https://upload.wikimedia.org/wikipedia/commons/4/4f/Dash%2C_the_mascot_of_the_Dart_programming_language.png',
      5,
    ),
    Task(
      'Estudar',
      'https://mariokarttour.com/_nuxt/img/d85c816.png',
      3,
    ),
    Task(
      'Academia',
      'https://static.wikia.nocookie.net/johnnybravo/images/b/bb/Johnnyb001.gif/revision/latest/thumbnail/width/360/height/360?cb=20190421193227',
      1,
    ),
  ];

  void newTask(String name, int difficulty, String photo) {
    taskList.add(
      Task(name, photo, difficulty),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
