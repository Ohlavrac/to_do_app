import 'package:to_do_app/data/dtos/tasks_dto.dart';

abstract class ILocalDatasource {
  Future<void> save(TasksDto task);
}