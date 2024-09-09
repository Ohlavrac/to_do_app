import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/datasources/local_datasource.dart';
import 'package:to_do_app/data/repositories/task_repository.dart';
import 'package:to_do_app/domain/usecases/save_task_usecase.dart';
import 'package:to_do_app/presentation/providers/task_provider.dart';
import 'package:to_do_app/presentation/screens/create_task_screen.dart';

import 'presentation/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localDatasource = LocalDatasource();
    final taskRepository = TaskRepository(local: localDatasource);
    final saveTaskUsecase = SaveTaskUsecase(repository: taskRepository);
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider(saveTaskUsecase: saveTaskUsecase))
      ],
      child: MaterialApp(
        initialRoute: "/home",
        routes: {
          "/home": (context) => const HomeScreen(),
          "/createtask": (context) => const CreateTaskScreen()
        }
      ),
    );
  }
}