import 'package:to_do_app/data/datasources/local_datasource.dart';
import 'package:to_do_app/data/dtos/tasks_dto.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/repositories/itask_repository.dart';

class TaskRepository implements ITaskRepository {
  late LocalDatasource localDatasource;

  @override
  Future<void> save(TaskEntity task) async {
    localDatasource.save(TasksDto.fromEntity(task));
  }

}