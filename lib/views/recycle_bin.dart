import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';

import '../widgets/task_list.dart';
import 'app_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.delete_forever),
                            label: const Text('Delete all Tasks'),
                          ),
                          onTap: () => context.read<TasksBloc>().add(
                                DeleteAllTasks(),
                              ),
                        ),
                      ])
            ],
          ),
          drawer: const AppDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTasks.length} Tasks'),
                ),
              ),
              TaskList(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
