import 'package:flutter/material.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/usecases/save_task_usecase.dart';

class TaskProvider extends ChangeNotifier {
  final SaveTaskUsecase saveTaskUsecase;

  TaskProvider({required this.saveTaskUsecase});

  Future<void> saveTask(TaskEntity task) async {
    await saveTaskUsecase.saveTask(task);
    notifyListeners();
  }
}