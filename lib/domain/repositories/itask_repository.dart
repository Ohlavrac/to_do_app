import 'package:to_do_app/domain/entities/task_entity.dart';

abstract class ITaskRepository {
  Future<void> save(TaskEntity task);
}