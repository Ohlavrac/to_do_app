import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/repositories/itask_repository.dart';

class SaveTaskUsecase {
  final ITaskRepository repository;

  SaveTaskUsecase({required this.repository});

  Future<void> saveTask(TaskEntity task) async {
    return await repository.save(task);
  }
}