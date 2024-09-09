import 'package:to_do_app/data/datasources/ilocal_datasource.dart';
import 'package:to_do_app/data/dtos/tasks_dto.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/repositories/itask_repository.dart';

class TaskRepository extends ITaskRepository {
  final ILocalDatasource local;

  TaskRepository({required this.local});

  @override
  Future<void> save(TaskEntity task) async {
    await local.save(TasksDto.fromEntity(task));
  }

}