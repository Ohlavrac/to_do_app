import 'package:uuid/uuid.dart';

class TaskEntity {
  Uuid? id;
  String? title;
  List<String?>? subtasks;

  TaskEntity({this.id, this.title, this.subtasks});
}