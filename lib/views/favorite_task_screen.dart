import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';


import '../models/task_model.dart';
import '../widgets/task_list.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({super.key});

  static const id = 'tasks_screen';


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('${tasksList.length} Tasks'),
              ),
            ),
            TaskList(tasksList: tasksList),
          ],
        );
      },
    );
  }
}
