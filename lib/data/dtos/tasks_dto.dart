import 'package:to_do_app/domain/entities/task_entity.dart';

class TasksDto {
  String id;
  String? title;
  List<String?>? subtasks;

  TasksDto({
    required this.id,
    this.title,
    this.subtasks
  });

  factory TasksDto.fromJson(Map<String, dynamic> json) => TasksDto(
    id: json["id"],
    title: json["title"],
    subtasks: json["subtasks"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtasks": subtasks
  };
  
  factory TasksDto.fromEntity(TaskEntity taskEntity) => TasksDto(
    id: taskEntity.id!,
    title: taskEntity.title,
    subtasks: taskEntity.subtasks
  );

  TaskEntity toEntity() {
    return TaskEntity(id: id, title: title, subtasks: subtasks);
  }
}