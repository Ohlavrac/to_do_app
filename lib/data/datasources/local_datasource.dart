import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/data/datasources/ilocal_datasource.dart';
import 'package:to_do_app/data/dtos/tasks_dto.dart';

class LocalDatasource implements ILocalDatasource {
  @override
  Future<void> save(TasksDto task) async {
    final prefs = await SharedPreferences.getInstance();
    String taskJson = jsonEncode(task.toJson());
    await prefs.setString("${task.id}", taskJson);
  }
}